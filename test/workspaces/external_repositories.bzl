'''Defines some helper macros to be called in a `WORKSPACE` file to add some
external repositories.
'''

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

load(
    "@dwtj_rules_java//java:repositories.bzl",
    "dwtj_remote_openjdk_repository",
)

load(
    "@dwtj_rules_java//graalvm:repositories.bzl",
    "remote_graalvm_repository",
)

_REMOTE_GRAALVM_VERSION = "20.2.0"
_REMOTE_GRAALVM_ARCHIVE_SHA256 = "5db74b5b8888712d2ac3cd7ae2a8361c2aa801bc94c801f5839351aba5064e29"
_REMOTE_GRAALVM_NATIVE_IMAGE_INSTALLABLE_JAR_SHA256 = "92b429939f12434575e4d586f79c5b686d322f29211d1608ed6055a97a35925c"

def remote_graalvm_linux_x64(name = "remote_graalvm_linux_x64"):
    remote_graalvm_repository(
        name = name,
        url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-{0}/graalvm-ce-java11-linux-amd64-{0}.tar.gz".format(_REMOTE_GRAALVM_VERSION),
        sha256 = _REMOTE_GRAALVM_ARCHIVE_SHA256,
        strip_prefix = "graalvm-ce-java11-{}".format(_REMOTE_GRAALVM_VERSION),
        native_image_installable_jar_url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-{0}/native-image-installable-svm-java11-linux-amd64-{0}.jar".format(_REMOTE_GRAALVM_VERSION),
        native_image_installable_jar_sha256 = _REMOTE_GRAALVM_NATIVE_IMAGE_INSTALLABLE_JAR_SHA256,
        os = "linux",
    )

def adoptopenjdk_linux_v11_0_8_10(name = "adoptopenjdk_linux_v11_0_8_10"):
    dwtj_remote_openjdk_repository(
        name = name,
        url = "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz",
        sha256 = "6e4cead158037cb7747ca47416474d4f408c9126be5b96f9befd532e0a762b47",
        strip_prefix = "jdk-11.0.8+10",
        os = "linux",
    )

_RULES_CC_COMMIT = "02becfef8bc97bda4f9bb64e153f1b0671aec4ba"
_RULES_CC_SHA256 = "00cb11a249c93bd59f8b2ae61fba9a34fa26a673a4839fb2f3a57c185a00524a"

def rules_cc():
    http_archive(
        name = "rules_cc",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/{}.tar.gz".format(_RULES_CC_COMMIT)],
            strip_prefix = "rules_cc-{}".format(_RULES_CC_COMMIT),
        sha256 = _RULES_CC_SHA256,
    )

_RULES_RUST_COMMIT = "e64700dc9b8b3869bce4f77b78c33cb9d088cc4b"
_RULES_RUST_SHA256 = "eb384450d3b89332b386173233daa66a71e13cf63fe6d9ee51bd09fba0eb41f2"

def rules_rust():
    http_archive(
        name = "io_bazel_rules_rust",
        url = "https://github.com/bazelbuild/rules_rust/archive/{}.tar.gz".format(_RULES_RUST_COMMIT),
        sha256 = _RULES_RUST_SHA256,
        strip_prefix = "rules_rust-{}".format(_RULES_RUST_COMMIT),
    )

RULES_JVM_EXTERNAL_ARCHIVE_INFO = {
    "tag": "3.3",
    "sha256": "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab",
}

def rules_jvm_external(name = "rules_jvm_external"):
    http_archive(
        name = name,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_ARCHIVE_INFO["tag"],
        sha256 = RULES_JVM_EXTERNAL_ARCHIVE_INFO["sha256"],
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_ARCHIVE_INFO["tag"],
    )
