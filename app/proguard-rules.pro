# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class com.faithlife.mobile {
#   public *;
#}

-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

##########
# OkHttp #
##########

# JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform

#########
# Moshi #
#########
-keepclasseswithmembers class * {
    @com.squareup.moshi.* <methods>;
}

-keep @com.squareup.moshi.JsonQualifier interface *

# Enum field names are used by the integrated EnumJsonAdapter.
# Annotate enums with @JsonClass(generateAdapter = false) to use them with Moshi.
-keepclassmembers @com.squareup.moshi.JsonClass class * extends java.lang.Enum {
    <fields>;
}

# The name of @JsonClass types is used to look up the generated adapter.
-keepnames @com.squareup.moshi.JsonClass class *

# Retain generated JsonAdapters if annotated type is retained.
-if @com.squareup.moshi.JsonClass class *
-keep class <1>JsonAdapter {
    <init>(...);
    <fields>;
}

################
# Moshi-Kotlin #
################
-keep class kotlin.reflect.jvm.internal.impl.builtins.BuiltInsLoaderImpl

-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

-keep class com.faithlife.mobile.notifications.Data.NotificationKind

#########
# Glide #
#########

-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

## If you're targeting any API level less than Android API 27, also include:
-dontwarn com.bumptech.glide.load.resource.bitmap.VideoDecoder

#####################
# Kotlin Coroutines #
#####################

# ServiceLoader support
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}

# Most of volatile fields are updated with AFU and should not be mangled
-keepclassmembernames class kotlinx.** {
    volatile <fields>;
}

###########################
# Architecture Components #
###########################

-keepattributes *Annotation* # Also used for Crashlytics
-keepclassmembers enum androidx.lifecycle.Lifecycle$Event {
    <fields>;
}
-keep class * implements androidx.lifecycle.LifecycleObserver {
}
-keep class * implements androidx.lifecycle.GeneratedAdapter {
    <init>(...);
}
-keepclassmembers class ** {
    @androidx.lifecycle.OnLifecycleEvent *;
}

####################
# R8 Optimizations #
####################

#-assumevalues class android.os.Build$VERSION {
#    int SDK_INT return 21..2147483647;
#}
