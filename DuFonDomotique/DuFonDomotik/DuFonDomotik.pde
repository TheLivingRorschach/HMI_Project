
import java.awt.Point;

import java.util.Scanner; 

PImage logo;
String mdp = "";
String mdpCode ="";
boolean mdpFaux = true;
Scanner sc = new Scanner(System.in);

ArrayList<Button> buttonsPageAcceuil;
ArrayList<Button> buttonsPageMaison;
ArrayList<Button> buttonsPageChambre;
ArrayList<Button> buttonsPageRoutine;
FSM mae;

void setup() {
   size(700, 950);
   
   buttonsPageAcceuil = new ArrayList();
   buttonsPageMaison = new ArrayList();
   buttonsPageChambre = new ArrayList();
   buttonsPageRoutine = new ArrayList();
   
   mae = FSM.PAGE_ACCEUIL; 
   
   initPageMaison();
   initPageChambre();
   initPageRoutine();
   initPageAcceuil();
   
   logo = loadImage("logo-removebg-preview.png");
   
}

void draw() {
  background(#001346);
  switch (mae) {
    case PAGE_ACCEUIL :
      affichePageAcceuil();
      break;
    case PAGE_MAISON :
      affichePageMaison();
      break;
    case PAGE_CHAMBRE :
      affichePageChambre();
      break;
    case PAGE_ROUTINE :
      affichePageRoutine();
      break;
    default :
      break;
  }
}

void affichePageAcceuil() {
  stroke(0);
  fill(255);
  circle(345,300,400); //Cercle blanc pour le fond du logo
  image(logo,150,100,400,400); //logo DFs
  noFill();
  stroke(#074F6A); //couleur de l'anneau autour du logo
  strokeWeight(7);
  ellipse(345, 300, 400, 400);
  
  strokeWeight(1);
  stroke(255);
  fill(255);
  rect(150,650,400,40,7);
  
  fill(255);
  textSize(18);
  text("Mot de passe :",150,640);
  fill(0);
  textSize(25);
  text(mdpCode,155,685);
  
  if(mdpFaux == false){
    textSize(13);
    fill(255,0,0);
    text("Mot de passe incorrect, veuillez réessayer.", 150, 705);
  }
}

void affichePageMaison() {
  for (int i = 0; i < buttonsPageMaison.size(); i++) {
    buttonsPageMaison.get(i).update();
  }
  fill(#FFFFFF);
  textSize(60);
  text("↶", 52, 100);
  text("Salon", 105, 440);
  text("SdB", 130, 690);
  text("Cuisine", 405, 440);
  text("Chambre", 380, 690);
}

void affichePageChambre() {
  for (int i = 0; i < buttonsPageChambre.size(); i++) {
    buttonsPageChambre.get(i).update();
  }
  fill(#FFFFFF);
  textSize(60);
  text("↶", 52, 100);
  text("Chambre", 215, 200);
  textSize(35);
  text("ManuMatin", 204, 393);
  text("Routine 2", 215, 545);
  text("Routine 3", 215, 695);
  text("Routine 4", 215, 845);
}

void affichePageRoutine() {
  fill(#FFFFFF);
  rect(150, 50, 470, 70, 20);
  fill(#000000);
  textSize(40);
  text("ManuMatin", 280, 100);
  for (int i = 0; i < buttonsPageRoutine.size(); i++) {
    buttonsPageRoutine.get(i).update();
  }
  fill(#FFFFFF);
  textSize(60);
  text("↶", 52, 100);
  textSize(20);
  text("Lundi", 70, 200);
  text("Mardi", 180, 200);
  text("Mercredi", 300, 200);
  text("Jeudi", 448, 200);
  text("Vendredi", 550, 200);
  text("Samedi", 120, 300);
  text("Dimanche", 275, 300);
  text("Tous les jours", 440, 300);
  fill(#0B063B);
  rect(365, 410, 120, 50);
  rect(185, 510, 320, 50);
  rect(185, 570, 320, 50);
  rect(185, 630, 320, 50);
  fill(#FFFFFF);
  textSize(40);
  text("Heure : 6h00", 220, 450); 
  text("+", 326, 668);
  textSize(30);
  text("Enclencher Réveil", 200, 546);
  text("Allumer lumière", 200, 608);
  fill(#AD3131);
  noStroke();
  circle(123, 532, 40);
  circle(123, 596, 40);
  rect(120, 820, 470, 70, 20);
  fill(#FFFFFF);
  textSize(40);
  text("-", 112, 543);
  text("-", 112, 607);
  text("Supprimer la routine", 150, 867);
}

void initPageChambre() {
  int longueur_routine = 100, largeur_routine = 500;
  int x_premier = 50, y_premier = 330, pas = 50;
  int longueur_on = 30, largeur_on = 100;
  int x_premier_on = 580, y_premier_on = y_premier + longueur_routine/2 - longueur_on/2, pas_on = longueur_routine + pas;
  ButtonRect retour2 = new ButtonRect(new Point(50, 50), 70, 70, FSM.PAGE_MAISON);
  ButtonRect routine1 = new ButtonRect(new Point(x_premier, y_premier), longueur_routine, largeur_routine, FSM.PAGE_ROUTINE);
  ButtonRect routine2 = new ButtonRect(new Point(x_premier, y_premier + longueur_routine + pas), longueur_routine, largeur_routine, FSM.PAGE_CHAMBRE);
  ButtonRect routine3 = new ButtonRect(new Point(x_premier, y_premier + 2*longueur_routine + 2*pas), longueur_routine, largeur_routine, FSM.PAGE_CHAMBRE);
  ButtonRect routine4 = new ButtonRect(new Point(x_premier, y_premier + 3*longueur_routine + 3*pas), longueur_routine, largeur_routine, FSM.PAGE_CHAMBRE);
  ButtonCircle routine1Butt = new ButtonCircle(new Point(x_premier_on, y_premier_on), longueur_on, largeur_on);
  ButtonCircle routine2Butt = new ButtonCircle(new Point(x_premier_on, y_premier_on + pas_on), longueur_on, largeur_on);
  ButtonCircle routine3Butt = new ButtonCircle(new Point(x_premier_on, y_premier_on + 2*pas_on), longueur_on, largeur_on);
  ButtonCircle routine4Butt = new ButtonCircle(new Point(x_premier_on, y_premier_on + 3*pas_on), longueur_on, largeur_on);
  buttonsPageChambre.add(retour2);
  buttonsPageChambre.add(routine1);
  buttonsPageChambre.add(routine1Butt);
  buttonsPageChambre.add(routine2);
  buttonsPageChambre.add(routine2Butt);
  buttonsPageChambre.add(routine3);
  buttonsPageChambre.add(routine3Butt);
  buttonsPageChambre.add(routine4);
  buttonsPageChambre.add(routine4Butt);
}

void initPageMaison() {
  ButtonRect retour = new ButtonRect(new Point(50, 50), 70, 70, FSM.PAGE_ACCEUIL);
  ButtonRect salon = new ButtonRect(new Point(50, 320), 200, 275, FSM.PAGE_MAISON);
  ButtonRect cuisine = new ButtonRect(new Point(375, 320), 200, 275, FSM.PAGE_MAISON);
  ButtonRect salleDeBain = new ButtonRect(new Point(50, 570), 200, 275, FSM.PAGE_MAISON);
  ButtonRect chambre = new ButtonRect(new Point(375, 570), 200, 275, FSM.PAGE_CHAMBRE);
  buttonsPageMaison.add(retour);
  buttonsPageMaison.add(salon);
  buttonsPageMaison.add(cuisine);
  buttonsPageMaison.add(salleDeBain);
  buttonsPageMaison.add(chambre);
}

void initPageRoutine() {
  ButtonRect retour = new ButtonRect(new Point(50, 50), 70, 70, FSM.PAGE_CHAMBRE);
  ButtonOnOff lundi = new ButtonOnOff(new Point(95, 230), 18);
  ButtonOnOff mardi = new ButtonOnOff(new Point(205, 230), 18);
  ButtonOnOff mercredi = new ButtonOnOff(new Point(340, 230), 18);
  ButtonOnOff jeudi = new ButtonOnOff(new Point(470, 230), 18);
  ButtonOnOff vendredi = new ButtonOnOff(new Point(590, 230), 18);
  ButtonOnOff samedi = new ButtonOnOff(new Point(153, 330), 18);
  ButtonOnOff dimanche = new ButtonOnOff(new Point(320, 330), 18);
  ButtonOnOff everyday = new ButtonOnOff(new Point(505, 330), 18);
  buttonsPageRoutine.add(retour);
  buttonsPageRoutine.add(lundi);
  buttonsPageRoutine.add(mardi);
  buttonsPageRoutine.add(mercredi);
  buttonsPageRoutine.add(jeudi);
  buttonsPageRoutine.add(vendredi);
  buttonsPageRoutine.add(samedi);
  buttonsPageRoutine.add(dimanche);
  buttonsPageRoutine.add(everyday);
}

void initPageAcceuil() {
  
}

void mousePressed() {
  Point p = new Point(mouseX, mouseY);
  ArrayList<Button> al = null;
  switch (mae) {
    case PAGE_ACCEUIL :
      al = buttonsPageAcceuil;
      break;
    case PAGE_MAISON :
      al = buttonsPageMaison;
      break;
    case PAGE_CHAMBRE :
      al = buttonsPageChambre;
      break;
    case PAGE_ROUTINE :
      al = buttonsPageRoutine;
      break;
    default :
      return;
  }
  for (int i = 0; i < al.size(); i++) {
        if (al.get(i).isUnderMouse(p)) {
          if (al.get(i) instanceof ButtonRect) {
            ButtonRect br = (ButtonRect)al.get(i);
            mae = br.getLink();
          } else {
            ButtonCircle bc = (ButtonCircle)al.get(i);
            bc.setActive(!bc.getActive());
          }
          break;
        }
      }
}

void keyPressed(){
 if(mae != FSM.PAGE_ACCEUIL) return;
 if (key == ENTER || key == RETURN){
   if(mdp.equals("manulafripouille")){
     mdpFaux = true;
     mae = FSM.PAGE_MAISON;
     mdp ="";
     mdpCode ="";
   } else {
     mdpFaux = false;
     mdp ="";
     mdpCode ="";
   }
 }
 else if (key == BACKSPACE){
   if(mdp.length() >=1){
     String newString = mdpCode.substring(0, mdpCode.length()-1);
     mdpCode = newString;
     String mdp2 = mdp.substring(0, mdp.length()-1);
     mdp = mdp2;
   }
 }
 else {
   mdpCode += "*";  
   mdp += key;
 }
}
