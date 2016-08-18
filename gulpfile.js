"use strict";

var gulp = require("gulp"),
	babel = require("gulp-babel"),
	concat = require("gulp-concat"),
	cssbeautify = require("gulp-cssbeautify"),
	cssnano = require("gulp-cssnano"),
	jshint = require("gulp-jshint"),
	ngAnnotate = require("gulp-ng-annotate"),
	plumber = require("gulp-plumber"),
	rename = require("gulp-rename"),
	sass = require("gulp-ruby-sass"),
	sourcemaps = require("gulp-sourcemaps"),
	uglify = require("gulp-uglify"),
	watch = require("gulp-watch"),
	cssconfig = {
		indent: '\t',
		openbrace: 'seperate-line',
		autosemicolor: true
	};
	
gulp.task('annotate', function() {
	return gulp.src('./angular/**/*.js')
		.pipe(plumber())
		.pipe(sourcemaps.init())
		.pipe(ngAnnotate())
		.pipe(concat('zeph.epk.js'))
		.pipe(gulp.dest('./public/ng/'))
		.pipe(uglify())
		.pipe(rename({ extname: ".min.js" }))
		.pipe(sourcemaps.write("."))
		.pipe(gulp.dest('./public/ng/'));
});

gulp.task('sass', function() {
	return sass(['./public/css/**/*.scss', './public/css/**/*.sass'])
		.pipe(plumber())
		.pipe(cssbeautify(cssconfig))
		.pipe(gulp.dest('./public/css'));
});

gulp.task('lint', function() {
  return gulp.src('./public/ng/zeph.epk.js')
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});

gulp.task('mini-css', function() {
	return gulp.src('./public/css/*.css')
		.pipe(plumber())
		.pipe(cssbeautify(cssconfig))
		//.pipe(sourcemaps.init())
		//.pipe(gulp.dest('./public/css'))
		.pipe(cssnano())
		.pipe(rename({ extname: ".min.css" }))
		//.pipe(sourcemaps.write("."))
		.pipe(gulp.dest('./public/css/minified'));
});

gulp.task("babel", function() {
	return gulp.src(["./public/js/**/*.es6", '!./{node_modules,node_modules/**}'])
		.pipe(plumber())
		.pipe(babel())
		.pipe(jshint())
		.pipe(gulp.dest("./public/js/"))
		.pipe(rename({ extname: ".es6.min.js" }))
		.pipe(gulp.dest("./public/js/"));
});

gulp.task("watch", function() {
	gulp.watch('./angular/**/*.js', ['annotate']);
	gulp.watch(['./public/css/**/*.scss', './public/css/**/*.sass'], ['sass', 'mini-css']);
	gulp.watch('./public/css/*.css', ['mini-css']);
	gulp.watch(['./public/js/**/*.es6', '!./{node_modules,node_modules/**}'], ['babel']);
	gulp.watch(['./public/ng/zeph.epk.js'], ['lint']);
	console.log("Gulp-Watch has begun watching ES6, Angular, CSS and SASS files.");
});

gulp.task('default', ['watch']);