<?php

declare(strict_types=1);

namespace Tests;

use Kata\Demo;
use PHPUnit\Framework\TestCase;

class DemoTest extends TestCase
{
    public function testDemoFunctionShouldReturnTrue(): void
    {
        $demo = new Demo();
        $result = $demo->demoFunctionThatReturnsTrue();
        self::assertTrue($result);
    }
}
