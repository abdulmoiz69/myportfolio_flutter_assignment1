import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPortfolioHomePage(),
    );
  }
}

class MyPortfolioHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            SizedBox(height: 32.0),
            _buildSkillsSection(),
            SizedBox(height: 32.0),
            _buildProjectsSection(),
            SizedBox(height: 32.0),
            _buildContactSection(),
          ],
        ),
      ),
      backgroundColor: Colors.black12,
    );
  }

  Widget _buildProfileSection() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/me.jpg'), // Use AssetImage for local images
            ),
            SizedBox(height: 16.0),
            Text(
              'Abdul Moiz',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          // Wrap widget instead of AnimationLimiter
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildSkillChip('Flutter'),
                  _buildSkillChip('Dart'),
                  _buildSkillChip('C++'),
                  _buildSkillChip('Python'),
                  _buildSkillChip('MySQL'),
                  _buildSkillChip('Assembly Language'),
                  _buildSkillChip('Machine Learning'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          // List your projects here with descriptions
          _buildProjectTile('-Traffic Light', 'Traffic signal system using Ics.'),
          _buildProjectTile('-Tic Tac Toe Game', 'Tic tac toe game using assembly language'),
          _buildProjectTile('-Hospital Management System', ' Hospital Management system by using php ,xampp in databases, '),


        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          Text(
            'Contact',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          // Add your contact information, social media links, etc.
          _buildContactTile(Icons.email, 'Email', 'abdulmoiz74396@gmail.com'),
          _buildContactTile(Icons.linked_camera, 'LinkedIn', 'https://www.linkedin.com/in/abdul-moiz-492295233'),
          _buildContactTile(Icons.link, 'Twitter X', 'https://x.com/AbdulMo91045196?t=BbtY5SPahahDI9WObDlzQA&s=08'),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.red,
      labelStyle: TextStyle(color: Colors.white),
    );
  }

  Widget _buildProjectTile(String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red, // Change the color here
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Colors.red, // Change the text color here
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          color:Colors.white, // Change the text color here
        ),
      ),

    );
  }
}
