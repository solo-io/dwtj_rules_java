'''This is the main part of the public API for this project.

This file re-exports all rules for public use.
'''

load("//graalvm:rules/graalvm_native_image_binary.bzl", _graalvm_native_image_binary = "graalvm_native_image_binary")

load("//graalvm:rules/graalvm_native_image_library/defs.bzl", _graalvm_native_image_library = "graalvm_native_image_library")

graalvm_native_image_binary  = _graalvm_native_image_binary

graalvm_native_image_library  = _graalvm_native_image_library
