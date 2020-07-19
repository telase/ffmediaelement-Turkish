﻿#pragma warning disable SA1201 // Elements must appear in the correct order
#pragma warning disable SA1117 // Parameters must be on same line or separate lines
namespace Unosquare.FFME
{
    using ClosedCaptions;
    using Common;
    using System;
    using System.ComponentModel;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Interop;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;

    public partial class MediaElement
    {
        #region IsDesignPreviewEnabled Dependency Property

        /// <summary>
        /// Gets or sets a value that indicates whether the MediaElement will display
        /// a preview image in design time. This is a dependency property.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("MediaElement öğesinin tasarım zamanında bir önizleme görüntüsü gösterip göstermeyeceğini gösteren bir değer alır veya ayarlar.")]
        public bool IsDesignPreviewEnabled
        {
            get => (bool)GetValue(IsDesignPreviewEnabledProperty);
            set => SetValue(IsDesignPreviewEnabledProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.IsDesignPreviewEnabled property.
        /// </summary>
        public static readonly DependencyProperty IsDesignPreviewEnabledProperty = DependencyProperty.Register(
            nameof(IsDesignPreviewEnabled), typeof(bool), typeof(MediaElement),
            new FrameworkPropertyMetadata(true, OnIsDesignPreviewEnabledPropertyChanged));

        private static void OnIsDesignPreviewEnabledPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d == null || d is MediaElement == false)
                return;

            if (!Library.IsInDesignMode)
                return;

            var element = (MediaElement)d;
            if (element.VideoView == null) return;

            if ((bool)e.NewValue)
            {
                if (element.VideoView.Source == null)
                {
                    var bitmap = Properties.Resources.FFmpegMediaElementBackground;
                    var bitmapSource = Imaging.CreateBitmapSourceFromHBitmap(
                        bitmap.GetHbitmap(), IntPtr.Zero, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
                    var controlBitmap = new WriteableBitmap(bitmapSource);
                    element.VideoView.Source = controlBitmap;
                }

                element.CaptionsView.Visibility = Visibility.Visible;
                element.SubtitlesView.Visibility = Visibility.Visible;
            }
            else
            {
                element.VideoView.Source = null;
                element.CaptionsView.Visibility = Visibility.Collapsed;
                element.SubtitlesView.Visibility = Visibility.Collapsed;
            }
        }

        #endregion

        #region Volume Dependency Property

        /// <summary>
        /// Gets/Sets the Volume property on the MediaElement.
        /// Note: Valid values are from 0 to 1.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Çalma ses seviyesi. Aralıkları 0.0 to 1.0")]
        public double Volume
        {
            get => (double)GetValue(VolumeProperty);
            set => SetValue(VolumeProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.Volume property.
        /// </summary>
        public static readonly DependencyProperty VolumeProperty = DependencyProperty.Register(
            nameof(Volume), typeof(double), typeof(MediaElement),
            new FrameworkPropertyMetadata(Constants.DefaultVolume, null, OnVolumePropertyChanging));

        private static object OnVolumePropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return Constants.DefaultVolume;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.Volume = (double)value;
            return element.MediaCore.State.Volume;
        }

        #endregion

        #region Balance Dependency Property

        /// <summary>
        /// Gets/Sets the Balance property on the MediaElement.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Sol ve sağ ses kanalları için ses dengesi. Geçerli aralıklar -1.0 to 1.0")]
        public double Balance
        {
            get => (double)GetValue(BalanceProperty);
            set => SetValue(BalanceProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.Balance property.
        /// </summary>
        public static readonly DependencyProperty BalanceProperty = DependencyProperty.Register(
            nameof(Balance), typeof(double), typeof(MediaElement),
            new FrameworkPropertyMetadata(Constants.DefaultBalance, null, OnBalancePropertyChanging));

        private static object OnBalancePropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return Constants.DefaultBalance;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.Balance = (double)value;
            return element.MediaCore.State.Balance;
        }

        #endregion

        #region IsMuted Dependency Property

        /// <summary>
        /// Gets/Sets the IsMuted property on the MediaElement.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Ses örneklerinin oluşturulup oluşturulmayacağını alır veya ayarlar.")]
        public bool IsMuted
        {
            get => (bool)GetValue(IsMutedProperty);
            set => SetValue(IsMutedProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.IsMuted property.
        /// </summary>
        public static readonly DependencyProperty IsMutedProperty = DependencyProperty.Register(
            nameof(IsMuted), typeof(bool), typeof(MediaElement),
            new FrameworkPropertyMetadata(false, null, OnIsMutedPropertyChanging));

        private static object OnIsMutedPropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return false;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.IsMuted = (bool)value;
            return element.MediaCore.State.IsMuted;
        }

        #endregion

        #region ScrubbingEnabled Dependency Property

        /// <summary>
        /// Gets or sets a value that indicates whether the MediaElement will update frames
        /// for seek operations while paused. This is a dependency property.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("MediaElement öğesinin son arama konumuna ulaşılmadan önce arama işlemleri için çerçeveleri görüntüleyip görüntülemeyeceğini gösteren bir değer alır veya ayarlar.")]
        public bool ScrubbingEnabled
        {
            get => (bool)GetValue(ScrubbingEnabledProperty);
            set => SetValue(ScrubbingEnabledProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.ScrubbingEnabled property.
        /// </summary>
        public static readonly DependencyProperty ScrubbingEnabledProperty = DependencyProperty.Register(
            nameof(ScrubbingEnabled), typeof(bool), typeof(MediaElement),
            new FrameworkPropertyMetadata(true, null, OnScrubbingEnabledPropertyChanging));

        private static object OnScrubbingEnabledPropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return false;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.ScrubbingEnabled = (bool)value;
            return element.MediaCore.State.ScrubbingEnabled;
        }

        #endregion

        #region VerticalSyncEnabled Dependency Property

        /// <summary>
        /// Gets or sets a value that indicates whether the MediaElement will update frames
        /// for seek operations while paused. This is a dependency property.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("MediaElement öğesinin son arama konumuna ulaşılmadan önce arama işlemleri için çerçeveleri görüntüleyip görüntülemeyeceğini gösteren bir değer alır veya ayarlar.")]
        public bool VerticalSyncEnabled
        {
            get => (bool)GetValue(VerticalSyncEnabledProperty);
            set => SetValue(VerticalSyncEnabledProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.VerticalSyncEnabled property.
        /// </summary>
        public static readonly DependencyProperty VerticalSyncEnabledProperty = DependencyProperty.Register(
            nameof(VerticalSyncEnabled), typeof(bool), typeof(MediaElement),
            new FrameworkPropertyMetadata(true, null, OnVerticalSyncEnabledPropertyChanging));

        private static object OnVerticalSyncEnabledPropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return false;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.VerticalSyncEnabled = (bool)value;
            return element.MediaCore.State.VerticalSyncEnabled;
        }

        #endregion

        #region SpeedRatio Dependency Property

        /// <summary>
        /// Gets/Sets the SpeedRatio property on the MediaElement.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Medyanın ne kadar hızlı veya ne kadar yavaş oluşturulması gerektiğini belirtir. 1.0 normal hızdır. Değer, ondan büyük veya ona eşit olmalıdır 0.0")]
        public double SpeedRatio
        {
            get => (double)GetValue(SpeedRatioProperty);
            set => SetValue(SpeedRatioProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.SpeedRatio property.
        /// </summary>
        public static readonly DependencyProperty SpeedRatioProperty = DependencyProperty.Register(
            nameof(SpeedRatio), typeof(double), typeof(MediaElement),
            new FrameworkPropertyMetadata(Constants.DefaultSpeedRatio, null, OnSpeedRatioPropertyChanging));

        private static object OnSpeedRatioPropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false)
                return Constants.DefaultSpeedRatio;

            var element = (MediaElement)d;
            if (element.IsStateUpdating)
                return value;

            element.MediaCore.State.SpeedRatio = (double)value;
            return element.MediaCore.State.SpeedRatio;
        }

        #endregion

        #region Position Dependency Property

        /// <summary>
        /// Gets/Sets the Position property on the MediaElement.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Temel ortamın konumunu belirtir. Bu özelliği medya akışından arayacak şekilde ayarla.")]
        public TimeSpan Position
        {
            get => (TimeSpan)GetValue(PositionProperty);
            set => SetValue(PositionProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.Position property.
        /// </summary>
        public static readonly DependencyProperty PositionProperty = DependencyProperty.Register(
            nameof(Position), typeof(TimeSpan), typeof(MediaElement),
            new FrameworkPropertyMetadata(TimeSpan.Zero,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                null, OnPositionPropertyChanging));

        private static object OnPositionPropertyChanging(DependencyObject d, object value)
        {
            if (d == null || d is MediaElement == false) return value;

            var element = (MediaElement)d;
            var mediaCore = element.MediaCore;

            if (mediaCore == null || mediaCore.IsDisposed || mediaCore.MediaInfo == null || !element.IsOpen)
                return TimeSpan.Zero;

            if (element.IsSeekable == false || element.IsStateUpdating)
                return value;

            // Clamp from minimum to maximum
            var targetSeek = (TimeSpan)value;
            var minTarget = mediaCore.State.PlaybackStartTime ?? TimeSpan.Zero;
            var maxTarget = mediaCore.State.PlaybackEndTime ?? TimeSpan.Zero;
            var hasValidTaget = maxTarget > minTarget;

            if (hasValidTaget)
            {
                targetSeek = targetSeek.Clamp(minTarget, maxTarget);
                mediaCore?.Seek(targetSeek);
            }
            else
            {
                targetSeek = mediaCore.State.Position;
            }

            return targetSeek;
        }

        #endregion

        #region LoadedBahavior Dependency Property

        /// <summary>
        /// Specifies the action that the media element should execute when it
        /// is loaded. The default behavior is that it is under manual control
        /// (i.e. the caller should call methods such as Play in order to play
        /// the media). If a source is set, then the default behavior changes to
        /// to be playing the media. If a source is set and a loaded behavior is
        /// also set, then the loaded behavior takes control.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Temel ortamın yüklendiğinde nasıl davranması gerektiğini belirtir. Varsayılan davranış Medyayı oynatmaktır.")]
        public MediaPlaybackState LoadedBehavior
        {
            get => (MediaPlaybackState)GetValue(LoadedBehaviorProperty);
            set => SetValue(LoadedBehaviorProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.LoadedBehavior property.
        /// </summary>
        public static readonly DependencyProperty LoadedBehaviorProperty = DependencyProperty.Register(
            nameof(LoadedBehavior), typeof(MediaPlaybackState), typeof(MediaElement),
            new FrameworkPropertyMetadata(MediaPlaybackState.Manual));

        #endregion

        #region UnoadedBahavior Dependency Property

        /// <summary>
        /// Specifies how the underlying media engine's resources should be handled when
        /// the unloaded event gets fired. The default behavior is to Close and release the resources.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Yüklenmeyen olay tetiklendiğinde temel medya motorunun kaynaklarının nasıl ele alınması gerektiğini belirtir.")]
        public MediaPlaybackState UnloadedBehavior
        {
            get => (MediaPlaybackState)GetValue(UnloadedBehaviorProperty);
            set => SetValue(UnloadedBehaviorProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.UnloadedBehavior property.
        /// </summary>
        public static readonly DependencyProperty UnloadedBehaviorProperty = DependencyProperty.Register(
            nameof(UnloadedBehavior), typeof(MediaPlaybackState), typeof(MediaElement),
            new FrameworkPropertyMetadata(MediaPlaybackState.Close, OnUnloadedBehaviorPropertyChanged));

        private static void OnUnloadedBehaviorPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d == null || d is MediaElement == false)
                return;

            var element = (MediaElement)d;
            if (element.VideoView == null) return;

            var behavior = element.UnloadedBehavior;
            element.VideoView.PreventShutdown = behavior != MediaPlaybackState.Close;
        }

        #endregion

        #region LoopingBehavior Dependency Property

        /// <summary>
        /// Specifies how the media should behave when it has ended. The default behavior is to Pause the media.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Medyanın bittiğinde nasıl davranması gerektiğini belirtir. Varsayılan davranış, Ortamı Duraklatmaktır.")]
        public MediaPlaybackState LoopingBehavior
        {
            get => (MediaPlaybackState)GetValue(LoopingBehaviorProperty);
            set => SetValue(LoopingBehaviorProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.LoopingBehavior property.
        /// </summary>
        public static readonly DependencyProperty LoopingBehaviorProperty = DependencyProperty.Register(
            nameof(LoopingBehavior), typeof(MediaPlaybackState), typeof(MediaElement),
            new FrameworkPropertyMetadata(MediaPlaybackState.Pause));

        #endregion

        #region ClosedCaptionsChannel Dependency Property

        /// <summary>
        /// Gets/Sets the ClosedCaptionsChannel property on the MediaElement.
        /// Note: Valid values are from 0 to 1.
        /// </summary>
        [Category(nameof(MediaElement))]
        [Description("Oluşturulacak video CC Kanalı. Aralıkları 0 dan 4 kadar")]
        public CaptionsChannel ClosedCaptionsChannel
        {
            get => (CaptionsChannel)GetValue(ClosedCaptionsChannelProperty);
            set => SetValue(ClosedCaptionsChannelProperty, value);
        }

        /// <summary>
        /// The DependencyProperty for the MediaElement.ClosedCaptionsChannel property.
        /// </summary>
        public static readonly DependencyProperty ClosedCaptionsChannelProperty = DependencyProperty.Register(
            nameof(ClosedCaptionsChannel), typeof(CaptionsChannel), typeof(MediaElement),
            new FrameworkPropertyMetadata(Constants.DefaultClosedCaptionsChannel, OnClosedCaptionsChannelPropertyChanged));

        private static void OnClosedCaptionsChannelPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is MediaElement m) m.CaptionsView.Reset();
        }

        #endregion

        #region Stretch Dependency Property

        /// <summary>
        /// Gets/Sets the Stretch on this MediaElement.
        /// The Stretch property determines how large the MediaElement will be drawn.
        /// </summary>
        public Stretch Stretch
        {
            get => (Stretch)GetValue(StretchProperty);
            set => SetValue(StretchProperty, value);
        }

        /// <summary>
        /// DependencyProperty for Stretch property.
        /// </summary>
        public static readonly DependencyProperty StretchProperty = DependencyProperty.Register(
            nameof(Stretch), typeof(Stretch), typeof(MediaElement),
            new FrameworkPropertyMetadata(Stretch.Uniform, AffectsMeasureAndRender, OnStretchPropertyChanged));

        private static void OnStretchPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is MediaElement m && m.VideoView != null && m.VideoView.IsLoaded && e.NewValue is Stretch v)
                m.VideoView.Stretch = v;
        }

        #endregion

        #region StretchDirection Dependency Property

        /// <summary>
        /// Gets/Sets the stretch direction of the ViewBox, which determines the restrictions on
        /// scaling that are applied to the content inside the ViewBox.  For instance, this property
        /// can be used to prevent the content from being smaller than its native size or larger than
        /// its native size.
        /// </summary>
        public StretchDirection StretchDirection
        {
            get => (StretchDirection)GetValue(StretchDirectionProperty);
            set => SetValue(StretchDirectionProperty, value);
        }

        /// <summary>
        /// DependencyProperty for StretchDirection property.
        /// </summary>
        public static readonly DependencyProperty StretchDirectionProperty = DependencyProperty.Register(
            nameof(StretchDirection), typeof(StretchDirection), typeof(MediaElement),
            new FrameworkPropertyMetadata(StretchDirection.Both, AffectsMeasureAndRender, OnStretchDirectionPropertyChanged));

        private static void OnStretchDirectionPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is MediaElement m && m.VideoView != null && m.VideoView.IsLoaded && e.NewValue is StretchDirection v)
                m.VideoView.StretchDirection = v;
        }

        #endregion

        #region IgnorePixelAspectRatio Dependency Property

        /// <summary>
        /// Gets/Sets the stretch direction of the ViewBox, which determines the restrictions on
        /// scaling that are applied to the content inside the ViewBox.  For instance, this property
        /// can be used to prevent the content from being smaller than its native size or larger than
        /// its native size.
        /// </summary>
        public bool IgnorePixelAspectRatio
        {
            get => (bool)GetValue(IgnorePixelAspectRatioProperty);
            set => SetValue(IgnorePixelAspectRatioProperty, value);
        }

        /// <summary>
        /// DependencyProperty for StretchDirection property.
        /// </summary>
        public static readonly DependencyProperty IgnorePixelAspectRatioProperty = DependencyProperty.Register(
            nameof(IgnorePixelAspectRatio), typeof(bool), typeof(MediaElement),
            new FrameworkPropertyMetadata(false, AffectsMeasureAndRender));

        #endregion
    }
}
#pragma warning restore SA1117 // Parameters must be on same line or separate lines
#pragma warning restore SA1201 // Elements must appear in the correct order