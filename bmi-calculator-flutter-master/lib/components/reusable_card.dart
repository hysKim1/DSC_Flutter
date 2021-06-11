import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  /* key class
   widget state 트랙킹함(에니메이션, 스크롤링)

  const ReusableContainer({
    Key key,
  }) : super(key: key);
*/

  //클릭할때마다 컨테이너 색상이 변경됨(필)
  /* instance Var , Field, property - construct a class to have a diff value/ a property that change inside the class
  immutability =unchangeable -> stateless widget ->update(replace the old one)
  일반 변수는 재정의 가능하나 const,final을 불가
  final  compile ->final running
  const  consst ->compile b4 running
  * */
  ReusableContainer({@required this.colour, this.cardChild, this.onPress});
  final Color colour; //final - immutable
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
