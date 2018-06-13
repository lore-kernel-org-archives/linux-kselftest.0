From: tom.hromatka@oracle.com (Tom Hromatka)
Date: Wed, 13 Jun 2018 11:20:57 -0600
Subject: [PATCH] selftests: sparc64: Fix to do nothing on non-sparc64
In-Reply-To: <20180612232348.27979-1-shuah@kernel.org>
References: <20180612232348.27979-1-shuah@kernel.org>
Message-ID: <d6a1ce6d-4903-ec7a-10aa-d40118fce45c@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180613172057.UbXvt89_FFvtQ2VkDdMBTHSuv2qMRcX-vghiPE0U2Mo@z>

Thanks, Shuah!

Tom


On 06/12/2018 05:23 PM, Shuah Khan (Samsung OSG) wrote:
> sparc64 test fails with the following errors on non-sparc64 systems. Fix
> the Makefile to do nothing on non-sparc64 systems to suppress the errors:
>
> make run_tests
> adi-test.c: Assembler messages:
> adi-test.c:302: Error: no such instruction: `rd %tick,%r13'
> adi-test.c:304: Error: no such instruction: `rd %tick,%rbp'
> adi-test.c:190: Error: no such instruction: `rd %tick,%rbp'
> adi-test.c:192: Error: no such instruction: `rd %tick,%rdx'
> adi-test.c:273: Error: no such instruction: `rd %tick,%rbx'
> adi-test.c:276: Error: no such instruction: `rd %tick,%rdx'
> adi-test.c:217: Error: no such instruction: `rd %tick,%rbp'
> adi-test.c:220: Error: no such instruction: `rd %tick,%rdx'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:246: Error: no such instruction: `rd %tick,%rbp'
> adi-test.c:248: Error: no such instruction: `rd %tick,%rdx'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
> <builtin>: recipe for target 'adi-test' failed
> make[1]: *** [adi-test] Error 1
> adi: [FAIL]
> ./drivers_test.sh: 24: ./drivers_test.sh: ./adi-test: not found
> ../lib.mk:73: recipe for target 'run_tests' failed
> make: *** [run_tests] Error 1
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Tom Hromatka <tom.hromatka at oracle.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
