From: daniel at iogearbox.net (Daniel Borkmann)
Date: Mon, 11 Jun 2018 12:58:41 +0200
Subject: [PATCH v2] selftests: bpf: fix urandom_read build issue
In-Reply-To: <20180608065127.28115-1-anders.roxell@linaro.org>
References: <CADYN=9JEi2=YcC0KD555atZFiJNbP8Y9O0UME+63iTpSSd=ttg@mail.gmail.com>
 <20180608065127.28115-1-anders.roxell@linaro.org>
Message-ID: <e974c47f-50eb-c8fc-43d6-4dcb22dea6e4@iogearbox.net>

On 06/08/2018 08:51 AM, Anders Roxell wrote:
> gcc complains that urandom_read gets built twice.
> 
> gcc -o tools/testing/selftests/bpf/urandom_read
> -static urandom_read.c -Wl,--build-id
> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf
> -I../../../../include/generated  -I../../../include    urandom_read.c
> urandom_read -lcap -lelf -lrt -lpthread -o
> tools/testing/selftests/bpf/urandom_read
> gcc: fatal error: input file
> ‘tools/testing/selftests/bpf/urandom_read’ is the
> same as output file
> compilation terminated.
> ../lib.mk:110: recipe for target
> 'tools/testing/selftests/bpf/urandom_read' failed
> To fix this issue remove the urandom_read target and so target
> TEST_CUSTOM_PROGS gets used.
> 
> Fixes: 81f77fd0deeb ("bpf: add selftest for stackmap with BPF_F_STACK_BUILD_ID")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Acked-by: Yonghong Song <yhs at fb.com>

Applied to bpf, thanks Anders!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
