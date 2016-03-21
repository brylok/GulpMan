var gulp = require('gulp'),
    imagemin = require('gulp-imagemin'),
    plumber = require('gulp-plumber'),
    notify = require('gulp-notify'),
    uglify = require('gulp-uglify'),
    concat = require('gulp-concat'),
    uncss  = require('gulp-uncss'), //uncss to remove unused css
    csso   = require('gulp-csso'), //s3 deployment
    gzip   = require('gulp-gzip'); //gzip assets

gulp.task('imgmin', function () {
    return gulp.src('source/images/*')
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{removeViewBox: false}]
        }))
        .pipe(gulp.dest('build/images/'));
});

//js build and compress
gulp.task('jscompress', function() {
    //concat js files
    gulp.src([
        'source/javascripts/vendor/jquery-2.1.4.min.js',
        'source/javascripts/vendor/google-fonts.js',
        'source/javascripts/vendor/bootstrap.min.js',
        'source/javascripts/vendor/wow.min.js',
        'source/javascripts/vendor/jquery.easing.js',
        'source/javascripts/vendor/jquery.fittext.js',
        'source/javascripts/application.js'
    ])
        .pipe(concat('application.js'))
        .pipe(gulp.dest('.tmp/dist/javascripts'))
        .pipe(uglify())
        .pipe(gulp.dest('.tmp/dist/javascripts'));
});

gulp.task('uncss', function() {
  return gulp.src('./build/stylesheets/*.css')
    .pipe(uncss({
        html: ['./build/*.html']
    }))
    .pipe(csso())
    .pipe(gulp.dest('./build/stylesheets'))
    .pipe(gzip())
    .pipe(gulp.dest('./build/stylesheets'));
});


gulp.task('default', ['jscompress']);
gulp.task('buildProd', ['imgmin', 'jscompress']);

// Scan site, remove unused css, minifiy css, gzip css
gulp.task('cleancss', ['uncss']);
