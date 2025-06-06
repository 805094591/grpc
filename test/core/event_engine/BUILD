# Copyright 2021 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("//bazel:grpc_build_system.bzl", "grpc_cc_library", "grpc_cc_test", "grpc_package")
load("//test/core/test_util:grpc_fuzzer.bzl", "grpc_fuzz_test")

licenses(["notice"])

grpc_package(
    name = "test/core/event_engine",
    visibility = "tests",
)

grpc_cc_test(
    name = "common_closures_test",
    srcs = ["common_closures_test.cc"],
    external_deps = [
        "absl/functional:any_invocable",
        "gtest",
    ],
    uses_polling = False,
    deps = [
        "//:gpr_platform",
        "//src/core:common_event_engine_closures",
        "//src/core:notification",
    ],
)

grpc_cc_test(
    name = "thread_pool_test",
    srcs = ["thread_pool_test.cc"],
    external_deps = [
        "absl/time",
        "gtest",
    ],
    uses_polling = False,
    deps = [
        "//:gpr",
        "//:grpc",
        "//src/core:event_engine_thread_count",
        "//src/core:event_engine_thread_pool",
        "//src/core:notification",
        "//test/core/test_util:grpc_test_util_unsecure",
    ],
)

grpc_cc_test(
    name = "endpoint_config_test",
    srcs = ["endpoint_config_test.cc"],
    external_deps = [
        "gtest",
    ],
    uses_polling = False,
    deps = [
        "//:gpr_platform",
        "//src/core:channel_args",
        "//src/core:channel_args_endpoint_config",
    ],
)

grpc_cc_test(
    name = "default_engine_methods_test",
    srcs = ["default_engine_methods_test.cc"],
    external_deps = [
        "absl/functional:any_invocable",
        "absl/status",
        "absl/status:statusor",
        "absl/time",
        "gtest",
    ],
    uses_polling = False,
    deps = [
        "mock_event_engine",
        "//:event_engine_base_hdrs",
        "//:gpr",
        "//src/core:default_event_engine",
        "//test/core/test_util:grpc_test_util",
    ],
)

grpc_cc_test(
    name = "factory_test",
    srcs = ["factory_test.cc"],
    external_deps = ["gtest"],
    uses_polling = False,
    deps = [
        "aborting_event_engine",
        "mock_event_engine",
        "//:event_engine_base_hdrs",
        "//:gpr_platform",
        "//src/core:default_event_engine",
        "//test/core/test_util:grpc_test_util_unsecure",
    ],
)

grpc_cc_test(
    name = "slice_buffer_test",
    srcs = ["slice_buffer_test.cc"],
    external_deps = [
        "absl/log:check",
        "gtest",
    ],
    uses_polling = False,
    deps = [
        "//:gpr",
        "//:gpr_platform",
        "//src/core:event_engine_common",
        "//src/core:slice",
    ],
)

grpc_cc_library(
    name = "test_init",
    srcs = ["test_init.cc"],
    hdrs = ["test_init.h"],
    external_deps = [
        "absl/status",
        "absl/strings",
    ],
    deps = ["//:gpr"],
)

grpc_cc_library(
    name = "aborting_event_engine",
    testonly = True,
    hdrs = ["util/aborting_event_engine.h"],
    external_deps = [
        "absl/functional:any_invocable",
        "absl/status",
        "absl/status:statusor",
    ],
    deps = [
        "//:event_engine_base_hdrs",
        "//:gpr",
    ],
)

grpc_cc_library(
    name = "delegating_event_engine",
    testonly = True,
    hdrs = ["util/delegating_event_engine.h"],
    external_deps = [
        "absl/functional:any_invocable",
        "absl/status",
        "absl/status:statusor",
    ],
    deps = [
        "//:event_engine_base_hdrs",
        "//:gpr",
    ],
)

grpc_cc_library(
    name = "mock_event_engine",
    testonly = True,
    hdrs = ["mock_event_engine.h"],
    external_deps = [
        "absl/functional:any_invocable",
        "absl/status",
        "absl/status:statusor",
        "gtest",
    ],
    deps = ["//:event_engine_base_hdrs"],
)

grpc_cc_test(
    name = "tcp_socket_utils_test",
    srcs = ["tcp_socket_utils_test.cc"],
    external_deps = [
        "absl/log:check",
        "absl/status",
        "absl/status:statusor",
        "absl/strings",
        "gtest",
    ],
    uses_event_engine = False,
    uses_polling = False,
    deps = [
        "//:gpr",
        "//:grpc",
        "//src/core:event_engine_tcp_socket_utils",
        "//src/core:iomgr_port",
    ],
)

grpc_cc_test(
    name = "handle_tests",
    srcs = ["handle_tests.cc"],
    external_deps = ["gtest"],
    uses_event_engine = False,
    uses_polling = False,
    deps = [
        "//:gpr_platform",
        "//:grpc",
    ],
)

grpc_cc_library(
    name = "event_engine_test_utils",
    testonly = True,
    srcs = ["event_engine_test_utils.cc"],
    hdrs = ["event_engine_test_utils.h"],
    external_deps = [
        "absl/log:check",
        "absl/log:log",
        "absl/status",
        "absl/status:statusor",
        "absl/strings",
        "absl/time",
    ],
    deps = [
        "//:event_engine_base_hdrs",
        "//:gpr",
        "//src/core:channel_args_endpoint_config",
        "//src/core:event_engine_common",
        "//src/core:event_engine_shim",
        "//src/core:event_engine_tcp_socket_utils",
        "//src/core:memory_quota",
        "//src/core:notification",
        "//src/core:time",
        "//test/core/test_util:build",
    ],
)

grpc_cc_test(
    name = "query_extensions_test",
    srcs = ["query_extensions_test.cc"],
    external_deps = ["gtest"],
    uses_event_engine = False,
    uses_polling = False,
    deps = [
        "//:gpr_platform",
        "//src/core:event_engine_query_extensions",
    ],
)

grpc_fuzz_test(
    name = "resolved_address_fuzzer",
    srcs = ["resolved_address_fuzzer.cc"],
    external_deps = [
        "absl/log:check",
        "fuzztest",
        "fuzztest_main",
    ],
    tags = ["no_windows"],
    deps = [
        "//:grpc",
        "//test/core/test_util:grpc_test_util",
    ],
)
