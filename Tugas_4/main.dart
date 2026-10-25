import 'package:flutter/material.dart';
import 'package:pertemuan4/api_service.dart';
import 'package:pertemuan4/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Berita',
      debugShowCheckedModeBanner: false,
      home: News(),
    );
  }
}

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final ScrollController _scrollController = ScrollController();

  List<Article> _articles = [];
  bool _isLoading = true;
  String? _errorMessage;
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadArticles();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Tombol "kembali ke atas" muncul setelah scroll lebih dari 200 px
  void _onScroll() {
    final shouldShow = _scrollController.offset > 200;
    if (shouldShow != _showScrollToTop) {
      setState(() => _showScrollToTop = shouldShow);
    }
  }

  Future<void> _loadArticles() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final articles = await ApiService().fetchArticles();
      setState(() => _articles = articles);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  // Membungkus pesan (loading/error/kosong) agar tetap bisa di-pull-to-refresh
  Widget _centeredScrollable(Widget child) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(child: child),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_isLoading && _articles.isEmpty) {
      return _centeredScrollable(const CircularProgressIndicator());
    }

    if (_errorMessage != null && _articles.isEmpty) {
      return _centeredScrollable(Text('Error : $_errorMessage'));
    }

    if (_articles.isEmpty) {
      return _centeredScrollable(
        const Text('Tidak ada berita yang ditemukan'),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    width: 80,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  )
                : const Icon(Icons.image),
            title: Text(article.title),
            subtitle: Text(article.description ?? 'Tidak Ada deskripsi'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Berita'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: RefreshIndicator(
        onRefresh: _loadArticles,
        child: _buildContent(),
      ),
      floatingActionButton: _showScrollToTop
          ? FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              tooltip: 'Kembali ke atas',
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}