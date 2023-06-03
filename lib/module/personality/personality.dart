
import 'package:flutter/material.dart';

class NowPersonality extends StatelessWidget {
  const NowPersonality({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personality :",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '1- Narcissistic :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Narcissistic personality is a mental state that generates a great feeling among people of their importance in society and always needs excessive attention and admiration, ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'that is, a narcissistic person is a person who does not have the ability to take into account the feelings of others,',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'exaggerate the appreciation of his talents and achievements and underestimate the talents of others. One of the types of narcissistic personality is the feeling of grandeur and pride that characterizes the narcissist, which transcends the trait of vanity, ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'as narcissists believe that they are the best and distinguished, and that they deserve association, places and things of high status.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '2- Social:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Social figures are those people who get the spotlight at almost every social event. They are mostly friendly people who love to interact with others and often have outstanding leadership skills, which make them successful leaders.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Unlike introverts, social people do not enjoy spending time alone, as being with others increases their vitality and activity.And if they are given the choice between vacationing at home or going to a social event, they will always choose to be with other people,even if they are feeling tired or having a bad day at work.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '3- Sensitive :',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'A Highly Sensitive Person, or HSP for short, is a term for people whose central nervous system is thought to be more sensitive to physical or emotional stimuli.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'While these people are often described in negative contexts as "hypersensitive,"',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'having a sensitive personality has its advantages and strengths as well as challenges and weaknesses just like any other personality.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Although HSPs are not empaths, they nevertheless tend sometimes to absorb other people\s feelings, just as an empathy does.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Therefore, it is not unusual for a sensitive person to enter a room, and immediately feel the general atmosphere and the feelings and feelings of others. This is because sensitive people are aware of subtle details (including facial expressions, body language, and tone of voice) that others overlook.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'And when this trait is combined with a highly sensitive person\'s ability to empathize, it makes perfect sense that sensitive people are able to feel emotions that aren\'t their own, leaving them constantly emotionally exhausted.' ,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
