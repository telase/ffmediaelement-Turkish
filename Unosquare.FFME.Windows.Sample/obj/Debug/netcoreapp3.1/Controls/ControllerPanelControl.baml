   M S B A M L   `   `   `  ����I  Effmeplay.win, Version=4.2.340.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:Unosquare.FFME.Windows.SampleUnosquare.FFME.Windows.Sample  5      c6clr-namespace:Unosquare.FFME.Windows.Sample.ViewModels(Unosquare.FFME.Windows.Sample.ViewModels  5      C    =Unosquare.FFME.Windows.Sample.Controls.ControllerPanelControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      =local+clr-namespace:Unosquare.FFME.Windows.Sample     5      Evm6clr-namespace:Unosquare.FFME.Windows.Sample.ViewModels     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      .��5	      � -   5        $��Controls��5	      $y�Visible=�6   $	��250��60   ��6=   Z� .+�5
   
   ��   J� IsHitTestVisible$  False��6      ShadedBackgroundBrush#���   6*   � 5   
   $��Bottom=�6    � RowDefinitions 5      �� 5      $��30 �6    6.   �� 5      $��40 �6    6.   �� 5      $��70 �6    6.   .+�5      �� -   5        $��PositionSlider��5      $��0��6+   $
��10,0q�68    � Cursor$
 Hand��6F     PositionSliderStyle#���  5       �� IsSnapToTickEnabled$ False��5      y�5      �� *Controller.SeekBarVisibility+{�5      �� *MediaElement.IsOpen+ � SmallChange 5      �� *MediaElement.PositionStep+  TimeSpanToSecondsConverter �� 	Converter# [  � LargeChange 5      �� *MediaElement.PositionStep+# [  � Minimum 5      �� * MediaElement.PlaybackStartTime+# [  � Maximum 5      �� *MediaElement.PlaybackEndTime+# [ 	 � Value	 5      �� *MediaElement.Position+# [ ]� 5      -   5        $��ProgressPanel��5      $��1��6-   $
��True��6:   $
��20,0q�6O   .+�5      �� $	��100��6   $��Center=�6`   $
��Left=�6{     CustomSliderHighlightBrush#��[ 6�   y�6(   �� *" Controller.IsMediaOpenVisibility+��6�   �� *MediaElement.Position+  TimeSpanFormatter# [ 
 �� Mode$
 OneWay=��� 5       $	��100��6   $��Center=�6\    �� TextAlignment$ Right=�6w   $��Right=�6�   #��[ 6�   y�6(   �� *Controller.SeekBarVisibility+��6�   �� * MediaElement.RemainingDuration+# [ $
 OneWay=�� 5!      $	��500��6    � ColumnDefinitions 5"      �� 5#      $	��100 �6+   �� 5$      �� 5%      �� 5&      $	��100 �6+   .+�5)      �� $��0��6^   $��Center=�6n   $ Center=�6�   #��[ 6�    � ToolTip$ Arabelleğe Alınıyor��69  y�6    �� *(&Controller.BufferingProgressVisibility+��6�   �� * MediaElement.BufferingProgress+  PercentageFormatter# [ 69  � 5*      $��1��6`   $��Center=�6p     NetworkProgressBarStyle#���  6�   y�6"   �� *(&Controller.BufferingProgressVisibility+	 6�   �� * MediaElement.BufferingProgress+$
 OneWay=� � IsIndeterminate 6�   �� *MediaElement.IsOpening+61  � 5+      $��2��6_   $��Center=�6o   #���  6�   y�6"   �� *'%Controller.DownloadProgressVisibility+	 6�   �� *MediaElement.DownloadProgress+$
 OneWay=� 6�   �� *MediaElement.IsOpening+6.  �� 5,      $��3��6]   $��Center=�6m   $ Center=�6�   #��[ 6�   $ İndirme İlerlemesi��67  y�6    �� *'%Controller.DownloadProgressVisibility+��6�   �� *MediaElement.DownloadProgress+# [ 67  5.      5/      � 51      -   5        $��ControlsPanel��51      $��2��6(   $
��20,0q�65    52      �� 53      $��1* �6'   �� 54      $��1* �6'   �� 55      $��1* �6'   .+�57      ]� -   5        $��LeftControls��57      $
��Left=�60   $��0��6K   .+�58      d�   ModernToggleButtonStyle#���  6[   $( "Dikey Senkronizasyonu Etkinleştir��6�   y�6#   �� *" Controller.CloseButtonVisibility+ d� 	IsChecked 6�   �� *" MediaElement.VerticalSyncEnabled+$
 TwoWay=�.��59      F�  �� Stretch$ Uniform=�6   ��61   ��   VerticalSyncIcon �� Source# [  �� Path$
 Data���6v   �� $ 
Foreground� �� RelativeSource ��  �� AncestorType" d�5:      d� 5;      #���  6W   $ Taramayı Etkinleştir��6�   y�6#   �� *Controller.SeekBarVisibility+ 6�   �� *MediaElement.ScrubbingEnabled+$
 TwoWay=�.��5<      F� $ Uniform=�6   ��61   ��  	 ScrubbingIcon# [	 $
 Data���6s   �� $ 
Foreground� �� " d�5=      d� 5>      -   5        $��SoundMenuButton��5>   [   #���  6r   y�6#   �� *" Controller.IsMediaOpenVisibility+.��5?      F� $ Uniform=�6   ��61   ��  
 AudioMenuIcon# [
 $
 Data���6s   �� $ 
Foreground� �� " d�5@      � 5A      -   5        $��SoundMenuPopup��5A   u    � 	StaysOpen$ False��6c   $
��Fade=�5B      $	��Top=�62    � VerticalOffset$ 2��5C       � HorizontalOffset$	 -18��6/   ��5A      �� *	IsChecked+ �� ElementName$ SoundMenuButton��$
 TwoWay=� � PlacementTarget 5B   B   �� $ SoundMenuButton�� � 	Resources 5D       �� 
TargetType �� Property �� Value��%�   '��       7  �� 5E      " ��6$   .�5F   "   ��  � ��8   6?   �� 5G   "    � ��$ Center=�6F   �� 5H   "    �@��TextAlignment$ Center=�6B   5I      5J      .��5K      �� ���	#FF1F1F1F���	#FF767676$��1q�6P   ._�5L      � $	��364��6#   $	��120��6/    5M   "   �� 5N   &   $��* �64   �� 5O   &   $��* �64   �� 5P   &   $��* �64    5R   "   �� 5S   &   $��60 �67   �� 5T   &   �� 5U   &   $��60 �67   .+�5Y   "   �� $��0��6,   $��0��69   Ses6N   �� 5Z   "   $��0��6)   $��1��6m     CustomSliderStyle#���  6}   $	 0.0Q�6�   $	 1.0Q�6�   {�66   �� *" Controller.IsAudioControlEnabled+	 6�   �� *MediaElement.Volume+�� 5[   "   $��0��6,   $��2��69   ��6I   �� *MediaElement.Volume+$
 OneWay=�# [ �� 5^   "   $��1��6,   $��0��69   Balans6Q   �� 5_   "   $��1��6)   $��1��6m   #���  6}   $
 -1.0Q�6�   $	 1.0Q�6�   {�66   �� *" Controller.IsAudioControlEnabled+	 6�   �� *MediaElement.Balance+�� 5`   "   $��1��6,   $��2��69   ��6I   �� *MediaElement.Balance+$
 OneWay=�# [  �� ConverterParameter$ 1���� 5c   "   $��2��6,   $��0��69   Hız6N   �� 5d   "   $��2��6^   $��1��6k   #���  6{   $	 0.0Q�6�   $	 8.0Q�6�   {�6)   �� * Controller.IsSpeedRatioEnabled+	 6�   �� *MediaElement.SpeedRatio+�� 5e   "   $��2��6,   $��2��69   ��6I   �� *MediaElement.SpeedRatio+$
 OneWay=�# [ 5g      5h      5i      d� 5j      -   5        $��MuteUnmuteButton��5j   \   #���  6t   y�6#   �� *#!Controller.AudioControlVisibility+ 6�   �� *MediaElement.IsMuted+$
 TwoWay=�.��5k      F� $ Uniform=�6   ��61   ��   
UnmuteIcon# [ $
 Data���6p   �� $ 
Foreground� �� " d�5l      d� 5m      -	   5        $��ClosedCaptionsButton��5m   #   #���  5n   #   y�5o   #   �� *%#Controller.ClosedCaptionsVisibility+ 5p   #   �� *$"MediaElement.ClosedCaptionsChannel+ " ClosedCaptionsChannelConverter# [ $
 TwoWay=�.��5q      �� $��1��6$   $
��Bold"�6e   $��11(�6�   ��61   �� *$"MediaElement.ClosedCaptionsChannel+��6w   �� $ 
Foreground� �� " d�6�   5r      5s      ]� 5u      -
   5        $��RightControls��5u      $��Right=�61   $��2��6M   .+�5w      d� #���  6W   $ Döngüyü Etkinleştir��6�   y�6#   �� *Controller.SeekBarVisibility+ 6�   �� *" Controller.IsLoopingMediaEnabled+$
 TwoWay=�.��5x      F� $ Uniform=�6   ��61   ��   
RepeatIcon# [ $
 Data���6p   �� $ 
Foreground� �� " d�5y      �� 5{        ModernButtonStyle#���  6   ��6I   �� *Commands.CloseCommand+y�6s   �� *" Controller.CloseButtonVisibility+.��5|      F� $ Uniform=�6   ��61   ��   	CloseIcon# [ $
 Data���6o   �� $ 
Foreground� �� " ��5}      �� 5      -   5        $��ToggleFullscreenButton��5      #���  6;   ��6g   �� *" Commands.ToggleFullscreenCommand+.��5�      F� $ Uniform=�6   ��61   ��   ToggleFullscreenIcon# [ $
 Data���6z   �� $ 
Foreground� �� " ��5�      d� 5�      -   5        $��OpenDebugButton��5�   O   #���  6f    6#   �� *IsPropertiesPanelOpen+.��5�      F� $ Uniform=�6   ��61   ��   OpenDebugIcon# [ $
 Data���6s   �� $ 
Foreground� �� " d�5�      d� 5�      -   5        $��OpenMenuButton��5�   M   #���  6c    6#   �� *IsPlaylistPanelOpen+y�6�   �� *!Controller.OpenButtonVisibility+.��5�      F� $ Uniform=�6   ��61   ��   OpenMenuIcon# [ $
 Data���6r   �� $ 
Foreground� �� " d�5�      5�      ]� 5�      -   5        $��CenterControls��5�      $��Center=�62   $��1��6O   .+�5�      �� #���  6T   y�6   �� *!Controller.PlayButtonVisibility+��6�   �� *Commands.PlayCommand+.��5�      F� $ Uniform=�6   ��61   ��   PlayIcon# [ $
 Data���6n   �� $ 
Foreground� �� " ��5�      �� 5�      #���  6U   y�6   �� *" Controller.PauseButtonVisibility+��6�   �� *Commands.PauseCommand+.��5�      F� $ Uniform=�6   ��61   ��   	PauseIcon# [ $
 Data���6o   �� $ 
Foreground� �� " ��5�      �� 5�      #���  6T   y�6   �� *!Controller.StopButtonVisibility+��6�   �� *Commands.StopCommand+.��5�      F� $ Uniform=�6   ��61   ��   StopIcon# [ $
 Data���6n   �� $ 
Foreground� �� " ��5�      5�      5�      5�      5�      5�      