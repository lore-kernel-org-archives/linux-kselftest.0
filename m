From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Mon, 18 Mar 2019 18:31:53 +0530
Subject: selftests: bpf: test_align Failed to find match 1:
 R1=ctx(id=0,off=0,imm=0) func#0 @0
Message-ID:
 <CA+G9fYuNFJSjH39P71UfZTE4SPGsT4AM2Eg_k++B61ck86k42w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318130153.yyB4_R4wsc_t-q7fVy7fQ8eWzvxS3Zg7F9hoXws7uhg@z>

selftests: bpf: test_align failed on all devices ( arm64, armv7,
x86_64 and i386) running Linux -next kernel 5.1.0-rc1 tag:
next-20190318.

Here is the log from arm64,

selftests: bpf: test_align
Test   0: mov ... Failed to find match 1: R1=ctx(id=0,off=0,imm=0)
func#0 @0
0: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R10=fp0,call_-1
0: (b7) r3 = 2
1: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv2 R10=fp0,call_-1
1: (b7) r3 = 4
2: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv4 R10=fp0,call_-1
2: (b7) r3 = 8
3: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv8 R10=fp0,call_-1
3: (b7) r3 = 16
4: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv16 R10=fp0,call_-1
4: (b7) r3 = 32
5: R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv32 R10=fp0,call_-1
5: (b7) r0 = 0
6: R0_w=inv0 R1=ctx(id=0 ref_obj_id=0,off=0,imm=0) R3_w=inv32 R10=fp0,call_-1
6: (95) exit
processed 7 insns (limit 131072), stack depth 0
FAIL
Test   1: shift ... Failed to find match 1: R1=ctx(id=0,off=0,imm=0)
func#0 @0
...
processed 6 insns (limit 131072), stack depth 0
FAIL
...
processed 22 insns (limit 131072), stack depth 0
FAIL
Results: 0 pass 12 fail
not ok 1..7 selftests: bpf: test_align [FAIL]
selftests: bpf_test_align [FAIL]

Test results comparison,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_align

Test complete log (  and you might notice large number of bpf test failure)
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190318/testrun/644906/log

Good linux -next tag: next-20190306
Bad linux -next tag: next-20190318
git branch     master
git commit    b9998194591467dc562c23ecefb63af4eff7530b
git describe  next-20190318
git repo
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Best regards
Naresh Kamboju
