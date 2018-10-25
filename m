From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Thu, 25 Oct 2018 14:24:17 +0530
Subject: [PATCH bpf-next 6/6] selftests/bpf: test_verifier, check
 bpf_map_lookup_elem access in bpf prog
In-Reply-To: <CAPhsuW72jhD+962NjSyxPrMhoeE9d24ArEVm0oDsP4FV46nNVA@mail.gmail.com>
References: <20181009010454.6652-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20181009010454.6652-7-bhole_prashant_q7@lab.ntt.co.jp>
 <CAPhsuW72jhD+962NjSyxPrMhoeE9d24ArEVm0oDsP4FV46nNVA@mail.gmail.com>
Message-ID: <CA+G9fYtT78hr4i6JDdeKBNoO4G_NMSVWUTyxMoU4_1ZfqGdthg@mail.gmail.com>

On Tue, 9 Oct 2018 at 12:32, Song Liu <liu.song.a23 at gmail.com> wrote:
>
> On Mon, Oct 8, 2018 at 6:07 PM Prashant Bhole
> <bhole_prashant_q7 at lab.ntt.co.jp> wrote:
> >
> > map_lookup_elem isn't supported by certain map types like:
> > - BPF_MAP_TYPE_PROG_ARRAY
> > - BPF_MAP_TYPE_STACK_TRACE
> > - BPF_MAP_TYPE_XSKMAP
> > - BPF_MAP_TYPE_SOCKMAP/BPF_MAP_TYPE_SOCKHASH
> > Let's add verfier tests to check whether verifier prevents
> > bpf_map_lookup_elem call on above programs from bpf program.
> >
> > Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> > Acked-by: Alexei Starovoitov <ast at kernel.org>
> Acked-by: Song Liu <songliubraving at fb.com>
>
> > ---
> >  tools/testing/selftests/bpf/test_verifier.c | 121 +++++++++++++++++++-
> >  1 file changed, 120 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> > index 65ae44c85d27..cf4cd32b6772 100644
> > --- a/tools/testing/selftests/bpf/test_verifier.c
> > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > @@ -48,7 +48,7 @@
> >
> >  #define MAX_INSNS      BPF_MAXINSNS
> >  #define MAX_FIXUPS     8
> > -#define MAX_NR_MAPS    8
> > +#define MAX_NR_MAPS    13
> >  #define POINTER_VALUE  0xcafe4all
> >  #define TEST_DATA_LEN  64
> >
> > @@ -65,6 +65,10 @@ struct bpf_test {
> >         int fixup_map_hash_48b[MAX_FIXUPS];
> >         int fixup_map_hash_16b[MAX_FIXUPS];
> >         int fixup_map_array_48b[MAX_FIXUPS];
> > +       int fixup_map_sockmap[MAX_FIXUPS];
> > +       int fixup_map_sockhash[MAX_FIXUPS];
> > +       int fixup_map_xskmap[MAX_FIXUPS];
> > +       int fixup_map_stacktrace[MAX_FIXUPS];
> >         int fixup_prog1[MAX_FIXUPS];
> >         int fixup_prog2[MAX_FIXUPS];
> >         int fixup_map_in_map[MAX_FIXUPS];
> > @@ -4541,6 +4545,85 @@ static struct bpf_test tests[] = {
> >                 .errstr = "invalid access to packet",
> >                 .prog_type = BPF_PROG_TYPE_SCHED_CLS,
> >         },
> > +       {
> > +               "prevent map lookup in sockmap",
> > +               .insns = {
> > +                       BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),
> > +                       BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> > +                       BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> > +                       BPF_LD_MAP_FD(BPF_REG_1, 0),
> > +                       BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
> > +                                    BPF_FUNC_map_lookup_elem),
> > +                       BPF_EXIT_INSN(),
> > +               },
> > +               .fixup_map_sockmap = { 3 },
> > +               .result = REJECT,
> > +               .errstr = "cannot pass map_type 15 into func bpf_map_lookup_elem",
> > +               .prog_type = BPF_PROG_TYPE_SOCK_OPS,
> > +       },
> > +       {
> > +               "prevent map lookup in sockhash",
> > +               .insns = {
> > +                       BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),
> > +                       BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> > +                       BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> > +                       BPF_LD_MAP_FD(BPF_REG_1, 0),
> > +                       BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
> > +                                    BPF_FUNC_map_lookup_elem),
> > +                       BPF_EXIT_INSN(),
> > +               },
> > +               .fixup_map_sockhash = { 3 },
> > +               .result = REJECT,
> > +               .errstr = "cannot pass map_type 18 into func bpf_map_lookup_elem",
> > +               .prog_type = BPF_PROG_TYPE_SOCK_OPS,
> > +       },
> > +       {
> > +               "prevent map lookup in xskmap",
> > +               .insns = {
> > +                       BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),
> > +                       BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> > +                       BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> > +                       BPF_LD_MAP_FD(BPF_REG_1, 0),
> > +                       BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
> > +                                    BPF_FUNC_map_lookup_elem),
> > +                       BPF_EXIT_INSN(),
> > +               },
> > +               .fixup_map_xskmap = { 3 },
> > +               .result = REJECT,
> > +               .errstr = "cannot pass map_type 17 into func bpf_map_lookup_elem",
> > +               .prog_type = BPF_PROG_TYPE_XDP,
> > +       },
> > +       {
> > +               "prevent map lookup in stack trace",
> > +               .insns = {
> > +                       BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),
> > +                       BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> > +                       BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> > +                       BPF_LD_MAP_FD(BPF_REG_1, 0),
> > +                       BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
> > +                                    BPF_FUNC_map_lookup_elem),
> > +                       BPF_EXIT_INSN(),
> > +               },
> > +               .fixup_map_stacktrace = { 3 },
> > +               .result = REJECT,
> > +               .errstr = "cannot pass map_type 7 into func bpf_map_lookup_elem",
> > +               .prog_type = BPF_PROG_TYPE_PERF_EVENT,
> > +       },
> > +       {
> > +               "prevent map lookup in prog array",
> > +               .insns = {
> > +                       BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),
> > +                       BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
> > +                       BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),
> > +                       BPF_LD_MAP_FD(BPF_REG_1, 0),
> > +                       BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 0, 0,
> > +                                    BPF_FUNC_map_lookup_elem),
> > +                       BPF_EXIT_INSN(),
> > +               },
> > +               .fixup_prog2 = { 3 },
> > +               .result = REJECT,
> > +               .errstr = "cannot pass map_type 3 into func bpf_map_lookup_elem",
> > +       },
> >         {
> >                 "valid map access into an array with a constant",
> >                 .insns = {
> > @@ -13515,6 +13598,10 @@ static void do_test_fixup(struct bpf_test *test, enum bpf_map_type prog_type,
> >         int *fixup_map_hash_48b = test->fixup_map_hash_48b;
> >         int *fixup_map_hash_16b = test->fixup_map_hash_16b;
> >         int *fixup_map_array_48b = test->fixup_map_array_48b;
> > +       int *fixup_map_sockmap = test->fixup_map_sockmap;
> > +       int *fixup_map_sockhash = test->fixup_map_sockhash;
> > +       int *fixup_map_xskmap = test->fixup_map_xskmap;
> > +       int *fixup_map_stacktrace = test->fixup_map_stacktrace;
> >         int *fixup_prog1 = test->fixup_prog1;
> >         int *fixup_prog2 = test->fixup_prog2;
> >         int *fixup_map_in_map = test->fixup_map_in_map;
> > @@ -13603,6 +13690,38 @@ static void do_test_fixup(struct bpf_test *test, enum bpf_map_type prog_type,
> >                         fixup_percpu_cgroup_storage++;
> >                 } while (*fixup_percpu_cgroup_storage);
> >         }
> > +       if (*fixup_map_sockmap) {
> > +               map_fds[9] = create_map(BPF_MAP_TYPE_SOCKMAP, sizeof(int),
> > +                                       sizeof(int), 1);
> > +               do {
> > +                       prog[*fixup_map_sockmap].imm = map_fds[9];
> > +                       fixup_map_sockmap++;
> > +               } while (*fixup_map_sockmap);
> > +       }
> > +       if (*fixup_map_sockhash) {
> > +               map_fds[10] = create_map(BPF_MAP_TYPE_SOCKHASH, sizeof(int),
> > +                                       sizeof(int), 1);
> > +               do {
> > +                       prog[*fixup_map_sockhash].imm = map_fds[10];
> > +                       fixup_map_sockhash++;
> > +               } while (*fixup_map_sockhash);
> > +       }
> > +       if (*fixup_map_xskmap) {
> > +               map_fds[11] = create_map(BPF_MAP_TYPE_XSKMAP, sizeof(int),
> > +                                       sizeof(int), 1);
> > +               do {
> > +                       prog[*fixup_map_xskmap].imm = map_fds[11];
> > +                       fixup_map_xskmap++;
> > +               } while (*fixup_map_xskmap);
> > +       }

selftests: bpf: test_verifier sockmap, sockhash, xskmap failed on
mainline and next
(from 4.19.0-rc7-next-20181011 to till date )
Are we missing any pre-required kernel configs ?

Test log,
------------
selftests: bpf: test_verifier
<>
#274/p prevent map lookup in sockmap Failed to create hash map
'Invalid argument'!
FAIL
Unexpected error message!
EXP: cannot pass map_type 15 into func bpf_map_lookup_elem
RES: fd -1 is not pointing to valid bpf_map
fd -1 is not pointing to valid bpf_map
#275/p prevent map lookup in sockhash Failed to create hash map
'Invalid argument'!
FAIL
Unexpected error message!
EXP: cannot pass map_type 18 into func bpf_map_lookup_elem
RES: fd -1 is not pointing to valid bpf_map
fd -1 is not pointing to valid bpf_map
#276/p prevent map lookup in xskmap Failed to create hash map 'Invalid
argument'!
FAIL
Unexpected error message!
EXP: cannot pass map_type 17 into func bpf_map_lookup_elem
RES: fd -1 is not pointing to valid bpf_map
fd -1 is not pointing to valid bpf_map
<>
Summary: 962 PASSED, 0 SKIPPED, 3 FAILED
not ok 1..1 selftests: bpf: test_verifier [FAIL]
selftests: bpf_test_verifier [FAIL]

-mainline results history,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_verifier

-next results history,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_verifier

Test case full log,
https://lkft.validation.linaro.org/scheduler/job/461881#L1655

Best regards
Naresh Kamboju

> > +       if (*fixup_map_stacktrace) {
> > +               map_fds[12] = create_map(BPF_MAP_TYPE_STACK_TRACE, sizeof(u32),
> > +                                        sizeof(u64), 1);
> > +               do {
> > +                       prog[*fixup_map_stacktrace].imm = map_fds[12];
> > +                       fixup_map_stacktrace++;
> > +               } while (fixup_map_stacktrace);
> > +       }
> >  }
> >
> >  static void do_test_single(struct bpf_test *test, bool unpriv,
> > --
> > 2.17.1
> >
> >
