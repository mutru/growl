FasdUAS 1.101.10   ��   ��    l    � ��  O     �    k    �     	  l   �� 
��   
 1 + Make a list of all the notification types     	     l   �� ��    ' ! that this script will ever send:         r    
    l 	   ��  J           m        Test Notification      ��  m        Another Test Notification   ��  ��    l      ��  o      ���� ,0 allnotificationslist allNotificationsList��        l   ������  ��        l   �� ��    ( " Make a list of the notifications           l   �� !��   ! - ' that will be enabled by default.             " # " l   �� $��   $ 9 3 Those not enabled by default can be enabled later     #  % & % l   �� '��   ' 7 1 in the 'Applications' tab of the growl prefpane.    &  ( ) ( r     * + * l 	   ,�� , J     - -  .�� . m     / /  Test Notification   ��  ��   + l      0�� 0 o      ���� 40 enablednotificationslist enabledNotificationsList��   )  1 2 1 l   ������  ��   2  3 4 3 l   �� 5��   5 &   Register our script with growl.    4  6 7 6 l   �� 8��   8 7 1 You can optionally (as here) set a default icon     7  9 : 9 l   �� ;��   ; ' ! for this script's notifications.    :  < = < I   ���� >
�� .registernull��� ��� null��   > �� ? @
�� 
appl ? l 	   A�� A m     B B  Growl AppleScript Sample   ��   @ �� C D
�� 
anot C l 
   E�� E o    ���� ,0 allnotificationslist allNotificationsList��   D �� F G
�� 
dnot F l 
   H�� H o    ���� 40 enablednotificationslist enabledNotificationsList��   G �� I��
�� 
iapp I m     J J  Script Editor   ��   =  K L K l   ������  ��   L  M N M l   �� O��   O #        Send a Notification...    N  P Q P l   ������  ��   Q  R S R l   ������  ��   S  T U T l   �� V��   V  
	No icon.	    U  W X W I   6���� Y
�� .notifygrnull��� ��� null��   Y �� Z [
�� 
name Z l 	 ! " \�� \ m   ! " ] ]  Test Notification   ��   [ �� ^ _
�� 
titl ^ l 	 % ( `�� ` m   % ( a a  Test Notification   ��   _ �� b c
�� 
desc b l 	 + . d�� d m   + . e e  No Icon.   ��   c �� f��
�� 
appl f m   / 2 g g  Growl AppleScript Sample   ��   X  h i h l  7 7������  ��   i  j k j l  7 7�� l��   l  	Absolute path icon.	    k  m n m I  7 X���� o
�� .notifygrnull��� ��� null��   o �� p q
�� 
name p l 	 9 < r�� r m   9 < s s  Test Notification   ��   q �� t u
�� 
titl t l 	 ? B v�� v m   ? B w w  Test Notification   ��   u �� x y
�� 
desc x l 	 E H z�� z m   E H { {  Icon from POSIX path.   ��   y �� | }
�� 
appl | m   I L ~ ~  Growl AppleScript Sample    } �� ��
�� 
iurl  m   O R � � P J/System/Library/CoreServices/loginwindow.app/Contents/Resources/LogOut.png   ��   n  � � � l  Y Y������  ��   �  � � � l  Y Y�� ���   �  	 icon from alias.	    �  � � � I  Y ~���� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � l 	 [ ^ ��� � m   [ ^ � �  Test Notification   ��   � �� � �
�� 
titl � l 	 a d ��� � m   a d � �  Test Notification   ��   � �� � �
�� 
desc � l 	 g j ��� � m   g j � �  Icon from alias.   ��   � �� � �
�� 
appl � m   k n � �  Growl AppleScript Sample    � �� ���
�� 
iurl � l  q x ��� � c   q x � � � m   q t � � P J:System:Library:CoreServices:loginwindow.app:Contents:Resources:LogOut.png    � m   t w��
�� 
alis��  ��   �  � � � l   ������  ��   �  � � � l   �� ���   �  		delay 10    �  � � � l   ������  ��   �  � � � l   �� ���   �  	Icon Of File    �  � � � I   ����� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
titl � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
desc � l 	 � � ��� � m   � � � �   Icon of File. (and Sticky)   ��   � �� � �
�� 
appl � m   � � � �  Growl AppleScript Sample    � �� � �
�� 
ifil � m   � � � �  ~/    � �� ���
�� 
stck � m   � ���
�� boovtrue��   �  � � � l  � �������  ��   �  � � � I  � ����� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
titl � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
desc � l 	 � � ��� � m   � � � �  	Message 1   ��   � �� � �
�� 
appl � m   � � � �  Growl AppleScript Sample    � �� ���
�� 
iden � m   � � � �  id   ��   �  � � � l  � �������  ��   �  ��� � I  � ����� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
titl � l 	 � � ��� � m   � � � �  Test Notification   ��   � �� � �
�� 
desc � l 	 � � ��� � m   � � � �  	Message 2   ��   � �� � �
�� 
appl � m   � � � �  Growl AppleScript Sample    � �� ��
�� 
iden � m   � � � �  id   �  ��    m      � �2null     ߀�� F��GrowlHelperApp.app���(��������`   )       �(����� �GRRR   alis    �  Macintosh HD               �g�H+   F��GrowlHelperApp.app                                              F����24        ����  	                	Resources     �f��      ��     F�� F�� F�� D  D  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  ��       �~ � ��~   � �}
�} .aevtoappnull  �   � **** � �| ��{�z � ��y
�| .aevtoappnull  �   � **** � k     � � �  �x�x  �{  �z   �   � 6 �  �w /�v�u B�t�s�r J�q�p�o ]�n a�m e g�l s w { ~�k ��j � � � � ��i � � � ��h ��g�f � � � ��e � � � � � ��w ,0 allnotificationslist allNotificationsList�v 40 enablednotificationslist enabledNotificationsList
�u 
appl
�t 
anot
�s 
dnot
�r 
iapp�q 
�p .registernull��� ��� null
�o 
name
�n 
titl
�m 
desc
�l .notifygrnull��� ��� null
�k 
iurl�j 

�i 
alis
�h 
ifil
�g 
stck�f 
�e 
iden�y �� ���lvE�O�kvE�O*��������� O*��a a a a �a � O*�a a a a a �a a a a  O*�a a a a a �a  a a !a "&a  O*�a #a a $a a %�a &a 'a (a )ea * O*�a +a a ,a a -�a .a /a 0a  O*�a 1a a 2a a 3�a 4a /a 5a  U ascr  ��ޭ