   M S B A M L   `   `   `  ����I  Effmeplay.win, Version=4.2.340.0, Culture=neutral, PublicKeyToken=nullc6clr-namespace:Unosquare.FFME.Windows.Sample.ViewModels(Unosquare.FFME.Windows.Sample.ViewModels  5      c6clr-namespace:Unosquare.FFME.Windows.Sample.Foundation(Unosquare.FFME.Windows.Sample.Foundation  5      A    ;Unosquare.FFME.Windows.Sample.Controls.PlaylistPanelControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      Evm6clr-namespace:Unosquare.FFME.Windows.Sample.ViewModels     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Iffmepl6clr-namespace:Unosquare.FFME.Windows.Sample.Foundation     5      -   5        $��
LayoutRoot��5   5   .��5      ��  !  SidePanelContainerBorderStyle#��[  5      {�5      �� *Playlist.IsPlaylistEnabled+._�5   
   ]� $
��True��6   .+�5      � $	��Top=�6   $
��Left=�6m   ��6(   ��   �� Path$  ActualWidth� �� ElementName$ PlaylistItemsControl�� � ColumnDefinitions 5      �� 5      �� 5      $
��Auto �6'   .+�5      ��  �� CornerRadius$ 8��5      $��1q�6*    �� Padding$ 	10,2,10,2q�6>   ���	#ddffffff$��6q�5   0   {�5      �� $ AddToggleButton��$  	IsChecked�  InverseBooleanConverter �� 	Converter# [ ._�5      �  5      �� 5      �� 5      $��20 �6/   .+�5      �� $��Kanal Arama . . .��6$   $
��Bold"�6=    �� Padding$ 4,0,0,0q�6O   $��Center=�5   $    J� IsHitTestVisible$ False��6?   ��5       �� 5!   "    �� 
TargetType" ��6(   .�5"   &   �� 	 �� Property	 � ��
 �� Value

 ���� 6C    �� Triggers 5#   &   �� 5$   *    �� Binding 66   �� $ SearchTextBox��$
  Text� �� UpdateSourceTrigger$ PropertyChanged=� �� Value  6�   .a�5%   .   �� 	 � ��
 �#7776K   5&   +   5(   #   5*      �� 5+      -   5         ��Name$ SearchTextBox��5+   "   $��0��69   
������ $��0q�6b   ���#484848$��16(�6�   $��2q�6�   $
��Bold"�6�   ��5,   "   �� *Playlist.PlaylistSearchString+$ PropertyChanged=�(� 5-      $��Right=�6"   $��1��6>   .��5.      F�  �� Stretch$ Uniform=�6#   ���#666��65   ��   
SearchIcon �� Source# [ $
  Data�6t   5/      50      51      � 52      $��1��6   .+�53      d� -   5         d�Name$ AddToggleButton��53   �   $	��Top=�6O     ModernToggleButtonStyle#���  6d    � ToolTip$ Open ...��6�    d� 	IsChecked 6#   �� *Playlist.IsInOpenMode+.��54      F� $ Uniform=�6   ��61   ��   AddIcon# [ $
  Data���6m   �� $  
Foreground� �� RelativeSource ��  �� AncestorType" d�55      56      57      � 5:      $	��Top=�6   $
��Left=�6(   ��5;      �� $  ActualWidth�$ PlaylistItemsControl����5<      �� 5=      " �6   .�5>      �� 	 � ��$
 44��63    5?      �� 5@       6*   �� *Playlist.IsInOpenMode+	 False6T    N� EnterActions 5A   "   �� 5B   &   .��5C   *   �� .��5D   .   W�  g� Duration$ 0:0:0.25D�6>   	 W� To 06R    �� TargetProperty$ Height�6Y   5E   +   5F   '    N� ExitActions 5H   "   �� 5I   &   .��5J   *   �� .��5K   .   W� $ 0:0:0.25D�6>    446R   $ Height�6Z   5L   +   5M   '   5O      5Q      .+�5S      �� $ 8��6   $��1q�6*   $ 	10,2,10,2q�6>   ���	#ddffffff$��6q�6i   ._�5T      � .+�5U      �� $T��NDosya veya URL'nin tam yolu (Açmak için yapıştır ve Enter tuşuna basın)��6$   $
��Bold"�5V   $   $ 4,0,0,0q�66   $��Center=�5W   $   $ False��6?   ��5X      �� 5Y   "   " ��6(   .�5Z   &   �� 	 � ��

 ���� 6C    5[   &   �� 5\   *    66   �� $ OpenFileTextBox��$
  Text�$ PropertyChanged=�  6�   .a�5]   .   �� 	 � ��
 �#7776K   5^   +   5`   #   5b      �� 5c      -   5        $ OpenFileTextBox��5c   "   $��0��6e   
������ $��0q�6�   ���#484848$��16(�5d   7   $��2q�6E   $
��Bold"�6R   ��5c   ;   �� *Playlist.OpenMediaSource+5d   R   5e      5g      5h      � 5k      -   5         �Name$ PlaylistPanelContentList��5k       � RowDefinitions 5l      �� 5m      �� 5n      $��30 �6$   .+�5p      �� -   5         ��Name$ PlaylistItemsControl��5p      $
��Left=�5s   #    %� IsVirtualizing$
 true��5t   #     %� VirtualizationMode$  	Recycling=�5u   #   ��5q   #   �� $  ActualHeight� �� ! �� Mode$! FindAncestor=� 	UIElement��5r   #   �� *Playlist.EntriesView+��5v      �� 5w      " �� 
TargetType"" ��6*   .R�5x      �� $
��true��6+   $��Visible=�5y   +   $��Hidden=�5z   +   .��5{   "   �� 5|      5}      ��5      �� 5�      .R�5�      $� $	��570��5�   !   # $� Orientation$# Vertical=�5�   !   $ K� IsItemsHost$
$ True��5�   !   5�      ��5�      �� 5�      % �� DataTypeB   <Unosquare.FFME.Windows.Sample.Foundation.CustomPlaylistEntry"%  6'   & � 	Resources& 5�      ' P� Property( P� Value��%�  '��       �� 5�   "   " ��6(   .�5�   &   �� 	 � ��

 � ���6C   �� 5�   &   	 �@��TextDecorations$
 	Underline{�6H    5�   &   P� 5�   *   ' �@��IsMouseOver$
( True��6I   . �5�   .   �� 	 � ��

 � E��6K   5�   +   P� 5�   *   ' �@��	IsEnabled$( False��6G   . �5�   .   �� 	 � ��#
 � ��6K   5�   +   P� 5�   *   ' �@��	IsEnabled$
( True��6G   . �5�   .   �� 	 �@�Cursor$

 Hand��6G   5�   +   5�   #   5�      .R�5�      �� $��0,4,0,0q�6%   $
��Left=�66   $	��570��6Q   ��5�   "   �� 5�   &   " ��6,   .�5�   *   �� 	 � ��
 5�   .   �� 5�   2   ) �� Color$) 	#ee1f1f1f��6B   5�   +    5�   *   :� 5�   .   * :� RoutedEvent$* Border.MouseEnter��6;   .[�5�   2   �� .��5�   6   �� .��5�   :   �� $ 0:0:0.25D�5�   A   	+ �� To+ 	#ee0000006U   $1 +(Border.Background).(SolidColorBrush.Color)�5�   A   5�   7   5�   3   5�   /   :� 5�   .   $* Border.MouseLeave��6;   .[�5�   2   �� .��5�   6   �� .��5�   :   �� $ 0:0:0.10D�5�   A   + 	#ee1f1f1f6U   $1 +(Border.Background).(SolidColorBrush.Color)�5�   A   5�   7   5�   3   5�   /   5�   '   ._�5�   "   �  5�   &   �� 5�   *   $
��Auto �6;   �� 5�   *   $��* �6;    5�   &   �� 5�   *   $��72 �68   .+�5�   &   �� ._�5�   *   �� , � Cursor$
, Hand��5�   1   $	��128��6?   ��5�   1   ��   	ViewModel# [ $  Commands.OpenCommand���5�   1   �� *MediaSource+��5�   .   �� 5�   2   .R�5�   6   � 
������ .+�5�   :   (� $��14q�6B   .��5�   >   F� $ Uniform=�6C   ���#444444��6U   ��   	MediaIcon# [ $
  Data�6�   5�   ;   �� 5�   :   $��Uniform=�6@   $��Stretch=�6R   $��Stretch=�6n   ��5�   I   �� $  	Thumbnail�- �� IsAsync$
- True�� # PlaylistEntryThumbnailConverter# [ 6�   5�   7   5�   3   5�   +   5�   '   ]� 5�   &   $��1��60   $��4q�6@   .+�5�   *   ]� $��Right=�64   $��80��6K   $��False��6V   .+�5�   .   �� $	��Top=�5�   5     ModernButtonStyle#���  5�   5   ��5�   5   �� # [ $  Commands.OpenCommand���5�   5   �� *MediaSource+.��5�   2   F� $ Uniform=�67   ��6I   ��  	 PlayIcon# [	 $
  Data���6�   �� $  
Foreground� �� " ��5�   /   �� 5�   .   $��Bottom=�68   
�������. �� TextAlignment$. Center=�5�   U   $��CharacterEllipsis=�6l   $��10(�6�   $
��Bold"�5�   =   $ 0,0,0,4q�6O   ��5�   P   �� *
Duration+ 
 PlaylistDurationFormatter# [
 5�   O   5�   +   �� 5�   *   $	��Top=�62   
������ ���	#00000000
�������$
��Bold"�5�   h   $��12(�6z   ��5�   G   �� *Title+.��5�   �   5�   +   �� 5�   *   $	��Top=�64   $��9(�5�   9   ���#666$��CharacterEllipsis=�6x   $��4,4,4,0q�5�   9   ��5�   I   �� *MediaSource+ 5�   F   �� *MediaSource+5�   9   �� 5�   *   $	��Top=�64   $��9(�5�   9   ���#666$��CharacterEllipsis=�6X   $��4,4,4,0q�5�   9   �� 5�   :   Görüntülendi6S    �� 5�   :   $
��Bold"�6D   ��6V   �� *LastOpenedUtc+  UtcDateToLocalTimeString# [  �� 5�   :   -6I    �� 5�   :   / �� Command/ 5�   =   �� # [ $(  "Commands.RemovePlaylistItemCommand�0 �� CommandParameter0 5�   =   �� .�6Z   KALDIR6b   5�   7   5�   '   5�   #   5�      5�      5�      �� 5�      $��1��6   $��Center=�6&   ._�5�      �� ���#ccc$. Center=�62   $��13(�6I   �� 5�      ��6$   �� $ PlaylistItemsControl��$  ItemsSource.Count� �� 5�       oynatma listesindeki öğeler.6C   5�      5�      5      5     5     5     