<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# NO CHECKED-IN PROTOBUF GENCODE
# source: math.proto

namespace GPBMetadata;

class Math
{
    public static $is_initialized = false;

    public static function initOnce() {
        $pool = \Google\Protobuf\Internal\DescriptorPool::getGeneratedPool();

        if (static::$is_initialized == true) {
          return;
        }
        $pool->internalAddGeneratedFile(
            "\x0A\xE9\x02\x0A\x0Amath.proto\x12\x04math\",\x0A\x07DivArgs\x12\x10\x0A\x08dividend\x18\x01 \x01(\x03\x12\x0F\x0A\x07divisor\x18\x02 \x01(\x03\"/\x0A\x08DivReply\x12\x10\x0A\x08quotient\x18\x01 \x01(\x03\x12\x11\x0A\x09remainder\x18\x02 \x01(\x03\"\x18\x0A\x07FibArgs\x12\x0D\x0A\x05limit\x18\x01 \x01(\x03\"\x12\x0A\x03Num\x12\x0B\x0A\x03num\x18\x01 \x01(\x03\"\x19\x0A\x08FibReply\x12\x0D\x0A\x05count\x18\x01 \x01(\x032\xA4\x01\x0A\x04Math\x12&\x0A\x03Div\x12\x0D.math.DivArgs\x1A\x0E.math.DivReply\"\x00\x12.\x0A\x07DivMany\x12\x0D.math.DivArgs\x1A\x0E.math.DivReply\"\x00(\x010\x01\x12#\x0A\x03Fib\x12\x0D.math.FibArgs\x1A\x09.math.Num\"\x000\x01\x12\x1F\x0A\x03Sum\x12\x09.math.Num\x1A\x09.math.Num\"\x00(\x01b\x06proto3"
        , true);

        static::$is_initialized = true;
    }
}

