;;; emms-player-mpv-android.el --- Integration of `mpv-android' for `emms-player-mpv' -*- lexical-binding: t -*-

;; Copyright (C) 2025 Bohong Huang

;; Author: Bohong Huang <bohonghuang@qq.com>
;; Maintainer: Bohong Huang <bohonghuang@qq.com>
;; Version: 1.0
;; Package-Requires: ((emacs "27.1"))
;; URL: https://github.com/bohonghuang/emms-player-mpv-android

;; Keywords: multimedia

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides operations for querying and filtering Org-srs
;; review items based on various composable predicates.

;;; Code:

(require 'cl-lib)

(defconst emms-player-mpv-android-directory (file-name-directory load-file-name))

(defconst emms-player-mpv-android-idle-icon (expand-file-name "mpv.png" emms-player-mpv-android-directory))

(define-advice emms-player-mpv-cmd (:filter-args (args) emms-player-mpv-android)
  (cl-destructuring-bind (cmd &rest args) args
    (cons (if (equal cmd '(stop)) `(loadfile ,emms-player-mpv-android-idle-icon) cmd) args)))

(cl-pushnew emms-player-mpv-android-directory exec-path :test #'equal)

(provide 'emms-player-mpv-android)
;;; emms-player-mpv-android.el ends here
