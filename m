From: pbonzini@redhat.com (Paolo Bonzini)
Date: Mon, 14 May 2018 19:16:51 +0200
Subject: [PATCH v3] selftests: add headers_install to lib.mk
In-Reply-To: <20180514115809.9803-1-anders.roxell@linaro.org>
References: <20180413090351.25662-1-anders.roxell@linaro.org>
 <20180514115809.9803-1-anders.roxell@linaro.org>
Message-ID: <3aae54a1-8f94-f9c4-a7e9-5a7b32f18818@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180514171651.WYuPWjsWcUJkEOsuq2Z9MIDdiCkuZlJfSdiWiU7wZsU@z>

On 14/05/2018 13:58, Anders Roxell wrote:
> If the kernel headers aren't installed we can't build all the tests.
> Add a new make target rule 'khdr' in the file lib.mk to generate the
> kernel headers and that gets include for every test-dir Makefile that
> includes lib.mk If the testdir in turn have its own sub-dirs the
> top_srcdir needs to be set to the linux-rootdir to be able to generate
> the kernel headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Reviewed-by: Fathi Boudra <fathi.boudra at linaro.org>

Ack for KVM parts.

Paolo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
