Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88113AFB19
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947357; cv=pass; b=sbMNJGVGwhvXWOGapiui5d3G0iQMkKxpitDOPDSCYBaERgn5jN9QW8lBWAhkmM3E1dzNFDjyT0MOl9O643N0O+0vRR0ZTypfI87uWvtp+6t3Hb83IK1RsVb0TGymYi5ZpgLUTaVxSCCtizAogdoXxYdvjR2LhlRPKwx8TJcbwUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947357; c=relaxed/simple;
	bh=zjSlEIeSsY+ppkgwGyT1XQ71qvjBTmdHeRYwiLV1/lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq0MvW6DlOrbm92xKKHwkAAxMJUXiR3iKSLiq3Wo3mwgP5lPTIHizfAwtx8Q3LONhz4S1jdZeLdPZxn+RoHH9yBasH3xKIJNkKERKixTv5Jm10SWT0DOfAPmn996xHqp9vcefT7ju6DN6HuJyIqEMJTJp3igC/ScWv7e09RgeS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtgHspZn; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtgHspZn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so4163095e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 20:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791947352; cv=none;
        d=google.com; s=arc-20260327;
        b=VBpYQwlCw1qRUKki3gIrjdUCVUnam/d4rkQcwF9uNO68MRPDQLctlGVfV0Emd6PENy
         k6Y/ObWXFzAand5LR14zxML3BiN13E//GP95C0dAlFuKRR30i+zXfd+Ubj+cTVlpjq9f
         d+0HS09kSZ/XHFAL6h1oU62wn4X66ya4KtxeanncvpGnu7XmWOocM5HGvxS6H9Umkl/p
         oM3dM897630KrywHb6jeQGLWX1KqoYCivx1ZsdGUd9y+cuBAtmiKkGgSSy8dLd7KQkK7
         r7mepAEzt87cjr59N0L4/AA94/ZDlWlRwItWksnTnHx5rv2ZL+g+5XsvyGtdrL4d0BEp
         ja6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dg/FJLgl2+mwHI4Z2oWxjJbJGHmbpRxeJlnH4/KzGP4=;
        fh=WtBDOm77PHEUiK3JO+U1a5Ll4vBgVoTFBQldDMGvE3U=;
        b=SromLqFooAfP7WypAFsNvwlUjFsgMg6Mj5s1Ogqotlx62Dwxyzd4Ffhnx/ZBhUfAny
         Ce7ayHAGuPcs/4Ut7PEhGv+9L2Qs9ojUr4mgMylmyJQfCIZM1xdidfEgNK0kF0jHvqTA
         QjAG4d3YXBFRCm5AklrqFvBcVim9aTZvQGgw/d0i//SebtgvBPY8SFw3AOSnCO6V556m
         DLIdXt4IX5WAxzp2B9NpxLRzpQGA+6i/D2vdVudS3LLYZMn43nRHGYL8B1KY6l+LSFXX
         zMrttkihuJ3DY94Oc2d5kleod6KkWTrgi4/hddFF1du+D+O+NpbTx9CdBboMxGpHME9W
         1hjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947352; x=1792552152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dg/FJLgl2+mwHI4Z2oWxjJbJGHmbpRxeJlnH4/KzGP4=;
        b=mtgHspZnn+WSi5VoY2MfUyk2K6W9xLOEYR44M/4WOg0bXSKOJ4cmMe1UouqSbR/vJC
         LrU5jpGS4K6OojtjUU4MsS7c2H72W5u2IRPj2gpFkejrO4eXACX5ktCKFggCUpiNB4BC
         qMoMikVuBGu0SDhb6gqcLKazdYcOsr+fF9qxkwdlx1hR4bcdGf+k/bToiWA0LVKlgxA/
         hloZ1QczZnkKM+gpIc9/x0LkZfIErzeZ2isSN5okRz/r1BV89dlu3+CDEStnJ2IlHyVe
         JZmJohjAufHwtn2sU0gZGZELk4uiHxwoD03XdcZ7wTJUE7snogY71Bnp/NlZoCO1oX4J
         CDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947352; x=1792552152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg/FJLgl2+mwHI4Z2oWxjJbJGHmbpRxeJlnH4/KzGP4=;
        b=uPRU0q9LiFXxN6ExHKPFDIUubVAbGFt5W/xQLidfm2FvU9sOLS4+K9pbqZZgsJpCJt
         Sr7npRI1tmwLnv070lhP2WWgsqozplKJEQel98s6y++QpPiCDOOuSRUEZO9OqTZw08wQ
         k36CbBO9/c6iNqMwb23mJ9uD4UTHvuhSDmsfa5snEoLfqSb3se+WpfI9do6suZ7oh1AT
         uTnpZ2R1fmF4M21qL6tBAXsTlvWPhfDfoTwpBuFMWvFbGcL3C0K3GvKhtW3cMIvnNTU2
         dvtvbimoXr6A8HKUuP3VNRiIVMeWdr0mEHUpj7NTwk21y4YI88ICXMtK3chGAnHLTnOL
         HBag==
X-Forwarded-Encrypted: i=1; AKwUvBzIKVv8fkEJUA7RuBRDWt8APhWuty1/KbLqL7lTQTmqyOVXXkqJcFvKec1Mt7nlSxFKyUfaVLWwDtf802Y7bnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhiLgJe3fdeb7eqgmoRa+tHx35hLErgw2GthiXjbSsAVczQ6ZM
	t9gFXOi3jNR5AILq9otPcdNCurat5CsIMn2gRaGXIZ6EI4jszl6voSv3ls5kPp4N/SQKD9QAyUq
	Co6lliG2XVYo2niaifAi86lFIcnYJxDk=
X-Gm-Gg: AYBFou3L7jxXHyZmF0Rfu5gvL2fYt3I+wgOt87n7LjcX5l4SOh2GSSROKe5zKNJIvNt
	wop9c8VR7FVmpP7WvXODdf+GfZ+7d2LXni/YjGJbom2tn6Xv9XDy8ohD8z2eqFkqVzzFosoxYQd
	4iC2bjlvkNAb9+PthU3d05hBAny2FyRLOpxYaYoPR4nYow/akgY+WvYExRnW+Bci60pS5V/903R
	E4N+lF3aD5YI0JSewLQX8R25QKbzVM/Bkvh0wELX2Wwqcpfcth8z15hmcA0q2sv4nvBRk2eHNir
	qGYY//+L4DX1l69v1gjelwBBTfCr7JyMNvIrn3Pgk+3MAuWKcmOqKhdv
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a18e4b67e1mr272791515e9.22.1791947351760; Tue, 13 Oct 2026
 20:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <FEE371F2-1B9F-43FA-AF21-F237504A11F1@nvidia.com>
In-Reply-To: <FEE371F2-1B9F-43FA-AF21-F237504A11F1@nvidia.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 14 Oct 2026 11:09:00 +0800
X-Gm-Features: AclHuK_q58Ds6pH6MFCPlS2SCQ_cOrhTZc1ffVBUM1qP9S1nis_OCreYq24xlXw
Message-ID: <CAN_Opa-=QsYFgZ-tENoqvpfqMhr=sZToFBs6NfbyTOpNLYQB1g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/15] hazptr: use Bloom filter for shared scan waiters
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"mingo@redhat.com" <mingo@redhat.com>, "frederic@kernel.org" <frederic@kernel.org>, 
	"neeraj.upadhyay@kernel.org" <neeraj.upadhyay@kernel.org>, 
	"josh@joshtriplett.org" <josh@joshtriplett.org>, "urezki@gmail.com" <urezki@gmail.com>, 
	"dave@stgolabs.net" <dave@stgolabs.net>, "lianux.mm@gmail.com" <lianux.mm@gmail.com>, 
	"stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, 
	"parri.andrea@gmail.com" <parri.andrea@gmail.com>, "will@kernel.org" <will@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "boqun@kernel.org" <boqun@kernel.org>, 
	"npiggin@gmail.com" <npiggin@gmail.com>, "dhowells@redhat.com" <dhowells@redhat.com>, 
	"j.alglave@ucl.ac.uk" <j.alglave@ucl.ac.uk>, "luc.maranget@inria.fr" <luc.maranget@inria.fr>, 
	"akiyks@gmail.com" <akiyks@gmail.com>, Dan Lustig <dlustig@nvidia.com>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, 
	"longman@redhat.com" <longman@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>, "qiang.zhang@linux.dev" <qiang.zhang@linux.dev>, 
	"brads@mainlining.org" <brads@mainlining.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "lkmm@lists.linux.dev" <lkmm@lists.linux.dev>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:03=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
>
>
> > On Oct 9, 2026, at 11:07=E2=80=AFPM, KunWu Chan <kunwu.chan@gmail.com> =
wrote:
> >
> > =EF=BB=BFOn Tue, Oct 6, 2026 at 1:51=E2=80=AFPM Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> >>> On 2026-10-05 13:15, Kunwu Chan wrote:
> >>> Replace the per-waiter exact-match scan with a shared Bloom filter
> >>> built during the second drain pass: each observed non-wildcard
> >>> address sets three bits, so a waiter whose address hashes to an
> >>> unset bit can be completed without another slot walk.
> >>>
> >>> A Bloom filter has no false negatives, so an address absent from
> >>> the final drain scan cannot be held by an observed slot; false
> >>> positives only delay completion to a later scan cycle.
> >>>
> >>> The filter uses a one-page bitmap with three multiply-shift hash
> >>> functions.  It lives in the hazptr_scan_state and is only touched
> >>> by the scan kthread, so waiter state remains on the caller's stack
> >>> and no dynamic allocation is needed.
> >>>
> >>> Suggested-by: Boqun Feng <boqun@kernel.org>
> >>
> >> I actually suggested that to Boqun in the first place. Feel
> >> free to add my suggested-by tag as well. :)
> >>
> >> Did you run your Bloom filter in a test program on the side to
> >> see how it behaves with pointers, and confirm that the false
> >> positive rate is not too high due to hashing algorithm/constants
> >> concerns ?
> >>
> >
> > Hi Mathieu,
> >
> > I ran a standalone test using the hash functions and
> > constants from
> > the patch, with random,
> > page-aligned, cacheline-aligned, sequential, and two synthetic
> > kernel-like address patterns.
>
> kernel-like? Linux or CUDA? I have to say I find AI generated messages ha=
rd to read.
>
> >
> > With 768 inserted addresses, the measured false-positive rates were
> > 0.025%=E2=80=930.034% across
> > these patterns, compared with an ideal Bloom-filter estimate of about
> > 0.031%. I also tested larger
> > insertion counts as stress cases. The results were consistent across
> > three seeds,
> > with only minor variation for the random distribution.
>
> Why is the distribution random?
>
> >
> > These are synthetic address distributions rather than measurements
> > from actual kernel waiter
> > addresses, but they provide an initial check of the hash functions
> > against several structured
> > address patterns.
>
> Why not just provide the test code? Oh, but your AI  crutches did not ask=
 you to do that.

Hi Joel,

Tested on x86-64 Ubuntu.
 $./hazptr-bloom-test 1
hazptr Bloom filter FP-rate sanity test
bitmap 32768 bits, k=3D3, 1000000 queries/point, seed 0x1

n                  100      256      512      768     1024     2000
 5000    10000
theory        0.000001 0.000012 0.000096 0.000313 0.000717 0.004684
0.049553 0.215670
random        0.000001 0.000009 0.000092 0.000291 0.000702 0.004786
0.049593 0.214689
page-aligned  0.000000 0.000004 0.000071 0.000251 0.000664 0.004892
0.060966 0.307875
cacheline     0.000001 0.000012 0.000096 0.000343 0.000781 0.004930
0.048607 0.228268
sequential    0.000002 0.000017 0.000104 0.000317 0.000709 0.004717
0.060357 0.235745
hi-half1      0.000002 0.000015 0.000083 0.000298 0.000690 0.005251
0.060659 0.285610
hi-half2      0.000001 0.000017 0.000106 0.000330 0.000722 0.004991
0.059801 0.309890

Here's the standalone test code:
// SPDX-License-Identifier: GPL-2.0
/*
 * Standalone hazptr Bloom-filter false-positive test.
 * Requires 64-bit LP64 userspace and 4 KiB pages.
 *
 * Build: gcc -O2 -Wall -Wextra -o hazptr-bloom-test hazptr-bloom-test.c -l=
m
 * Run:   ./hazptr-bloom-test [seed]
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
#include <math.h>
#include <time.h>

#define HAZPTR_BLOOM_HASHES 3
#define HAZPTR_BLOOM_NBITS  (4096UL * 8)
#define HAZPTR_BLOOM_LONGS  (4096 / sizeof(unsigned long))

_Static_assert(sizeof(unsigned long) =3D=3D 8, "64-bit LP64 userspace requi=
red");
_Static_assert(sizeof(void *) =3D=3D 8, "64-bit pointers required");

struct hazptr_bloom {
        unsigned long map[HAZPTR_BLOOM_LONGS];
};

static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
{
        static const uint64_t mult[HAZPTR_BLOOM_HASHES] =3D {
                0x9E3779B97F4A7C15ULL, 0xC2B2AE3D27D4EB4FULL,
0x165667B19E3779F9ULL,
        };

        /* 32768 bits: use the top 15 product bits. */
        return (uint64_t)(unsigned long)addr * mult[i] >> 49;
}

static void set_bit(unsigned long *map, unsigned long bit)
{
        map[bit / (sizeof(unsigned long) * 8)] |=3D
                1UL << (bit % (sizeof(unsigned long) * 8));
}

static bool test_bit(const unsigned long *map, unsigned long bit)
{
        return map[bit / (sizeof(unsigned long) * 8)] &
                (1UL << (bit % (sizeof(unsigned long) * 8)));
}

static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
{
        memset(bloom->map, 0, sizeof(bloom->map));
}

static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
{
        for (unsigned int i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
                set_bit(bloom->map, hazptr_bloom_hash(addr, i));
}

static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, void *a=
ddr)
{
        for (unsigned int i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
                if (!test_bit(bloom->map, hazptr_bloom_hash(addr, i)))
                        return false;
        return true;
}

static uint64_t prng_state =3D 0x9E3779B97F4A7C15ULL;

static uint64_t prng(void)
{
        prng_state ^=3D prng_state >> 12;
        prng_state ^=3D prng_state << 25;
        prng_state ^=3D prng_state >> 27;
        return prng_state * 0x2545F4914F6CDD1DULL;
}

static void prng_seed(uint64_t seed)
{
        prng_state =3D seed ? seed : 0x9E3779B97F4A7C15ULL; /* 0 would free=
ze */
}

struct dist {
        const char *name;
        uint64_t obs_base, query_base;  /* roots for inserted / queried set=
s */
        uint64_t prefix;        /* OR'd into every address */
        uint64_t stride;        /* 0 =3D> random low 48 bits */
};

/*
 * The inserted and queried address sets must be disjoint.
 * Keep them disjoint when changing bases, strides, or query count.
 */
static void gen_addrs(const struct dist *d, uint64_t base, int n, void **ou=
t)
{
        for (int i =3D 0; i < n; i++)
                out[i] =3D (void *)(d->stride ?
                           (base | d->prefix) + (uint64_t)i * d->stride :
                           base | (prng() & 0xFFFFFFFFFFFFULL));
}

/* Synthetic x86-64 high-half address patterns. */
static const struct dist dists[] =3D {
        { "random",      0x1111000000000000, 0x2222000000000000, 0,
              0 },
        { "page-aligned",       0x888100000000,     0x999100000000,
 0,                  4096 },
        { "cacheline",   0x888200000000,     0x999200000000,     0,
              64 },
        { "sequential",  0x888300000000,     0x999300000000,     0,
              8 },
        { "hi-half1",    0,                  0x100000000000,
0xffff800000000000, 4096 },
        { "hi-half2",    0,                  0x200000000000,
0xffff888000000000, 4096 },
};

#define N_QUERIES 1000000
#define MAX_N     10000  /* largest entry in sizes[] */

static const int sizes[] =3D { 100, 256, 512, 768, 1024, 2000, 5000, 10000 =
};

static double fp_rate(const struct dist *d, int n, void **obs, void **queri=
es)
{
        struct hazptr_bloom bloom;
        int fp =3D 0;

        gen_addrs(d, d->obs_base, n, obs);
        hazptr_bloom_reset(&bloom);
        for (int i =3D 0; i < n; i++)
                hazptr_bloom_add(&bloom, obs[i]);

        gen_addrs(d, d->query_base, N_QUERIES, queries);
        for (int i =3D 0; i < N_QUERIES; i++)
                fp +=3D hazptr_bloom_contains(&bloom, queries[i]);

        return (double)fp / N_QUERIES;
}

/* ideal Bloom filter: (1 - e^(-kn/m))^k */
static double theory(int n)
{
        double k =3D HAZPTR_BLOOM_HASHES, m =3D HAZPTR_BLOOM_NBITS;

        return pow(1.0 - exp(-k * n / m), k);
}

int main(int argc, char **argv)
{
        int n_sizes =3D sizeof(sizes) / sizeof(sizes[0]);
        int n_dists =3D sizeof(dists) / sizeof(dists[0]);
        uint64_t seed;

        if (argc > 1) {
                char *end;

                errno =3D 0;
                seed =3D strtoull(argv[1], &end, 0);
                if (argv[1][0] =3D=3D '-' || errno ||
                    end =3D=3D argv[1] || *end !=3D '\0') {
                        fprintf(stderr, "invalid seed: %s\n", argv[1]);
                        return 1;
                }
        } else {
                seed =3D (uint64_t)time(NULL);
        }

        void **obs =3D malloc(sizeof(*obs) * MAX_N);
        void **queries =3D malloc(sizeof(*queries) * N_QUERIES);

        if (!obs || !queries) {
                perror("malloc");
                free(obs);
                free(queries);
                return 1;
        }
        prng_seed(seed);

        printf("hazptr Bloom filter FP-rate sanity test\n");
        printf("bitmap %lu bits, k=3D%d, %d queries/point, seed %#llx\n\n",
               HAZPTR_BLOOM_NBITS, HAZPTR_BLOOM_HASHES, N_QUERIES,
               (unsigned long long)seed);

        printf("%-13s", "n");
        for (int j =3D 0; j < n_sizes; j++)
                printf("%9d", sizes[j]);
        printf("\n%-13s", "theory");
        for (int j =3D 0; j < n_sizes; j++)
                printf("%9.6f", theory(sizes[j]));
        printf("\n");

        for (int i =3D 0; i < n_dists; i++) {
                printf("%-13s", dists[i].name);
                for (int j =3D 0; j < n_sizes; j++)
                        printf("%9.6f",
                               fp_rate(&dists[i], sizes[j], obs, queries));
                printf("\n");
        }

        free(queries);
        free(obs);
        return 0;
}

Thanks,
Kunwu

>
> Joel
>
>
>
> >
> > Thanks,
> > Kunwu
> >
> >> Thanks!
> >>
> >> Mathieu
> >>
> >>> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> >>> ---
> >>>  kernel/hazptr.c | 93 +++++++++++++++++++++++++++++++++++++++++++----=
--
> >>>  1 file changed, 83 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/kernel/hazptr.c b/kernel/hazptr.c
> >>> index 9e274a691af5..900ba35de2cb 100644
> >>> --- a/kernel/hazptr.c
> >>> +++ b/kernel/hazptr.c
> >>> @@ -7,6 +7,7 @@
> >>>   */
> >>>
> >>>  #include <linux/hazptr.h>
> >>> +#include <linux/bitops.h>
> >>>  #include <linux/percpu.h>
> >>>  #include <linux/spinlock.h>
> >>>  #include <linux/mutex.h>
> >>> @@ -16,6 +17,7 @@
> >>>  #include <linux/kthread.h>
> >>>  #include <linux/swait.h>
> >>>  #include <linux/sched.h>
> >>> +#include <linux/bitmap.h>
> >>>
> >>>  /*
> >>>   * The current hazard pointer wildcard. Flips between 1UL and 2UL to=
 guarantee
> >>> @@ -213,6 +215,55 @@ void hazptr_scan_period(void *addr, void *scan_w=
ildcard)
> >>>      }
> >>>  }
> >>>
> >>> +/* Number of hash functions for the Bloom filter. */
> >>> +#define HAZPTR_BLOOM_HASHES 3
> >>> +
> >>> +/* Number of bits in the Bloom filter bitmap: one page. */
> >>> +#define HAZPTR_BLOOM_NBITS (PAGE_SIZE * 8)
> >>> +
> >>> +struct hazptr_bloom {
> >>> +     unsigned long map[PAGE_SIZE / sizeof(unsigned long)];
> >>> +};
> >>> +
> >>> +/*
> >>> + * Multiply @addr by a per-hash odd constant and use the high bits
> >>> + * as the Bloom filter index.
> >>> + */
> >>> +static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
> >>> +{
> >>> +     static const u64 mult[HAZPTR_BLOOM_HASHES] =3D {
> >>> +             0x9E3779B97F4A7C15ULL,
> >>> +             0xC2B2AE3D27D4EB4FULL,
> >>> +             0x165667B19E3779F9ULL,
> >>> +     };
> >>> +     u64 hash =3D (u64)(unsigned long)addr * mult[i];
> >>> +
> >>> +     return hash >> (64 - ilog2(HAZPTR_BLOOM_NBITS));
> >>> +}
> >>> +
> >>> +static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
> >>> +{
> >>> +     bitmap_zero(bloom->map, HAZPTR_BLOOM_NBITS);
> >>> +}
> >>> +
> >>> +static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
> >>> +{
> >>> +     unsigned int i;
> >>> +
> >>> +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> >>> +             __set_bit(hazptr_bloom_hash(addr, i), bloom->map);
> >>> +}
> >>> +
> >>> +static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, =
void *addr)
> >>> +{
> >>> +     unsigned int i;
> >>> +
> >>> +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> >>> +             if (!test_bit(hazptr_bloom_hash(addr, i), bloom->map))
> >>> +                     return false;
> >>> +     return true;
> >>> +}
> >>> +
> >>>  struct hazptr_waiter {
> >>>      struct list_head node;
> >>>      void *addr;
> >>> @@ -226,17 +277,26 @@ struct hazptr_scan_state {
> >>>      struct mutex lock;
> >>>      struct list_head pending;
> >>>      struct list_head scanning;      /* kthread only */
> >>> +     struct hazptr_bloom bloom;      /* kthread only */
> >>>  };
> >>>  static struct hazptr_scan_state hazptr_scan;
> >>>
> >>>  /*
> >>> - * Check per-CPU slots before overflow-list slots to match the
> >>> - * acquisition ordering of promoted slots.
> >>> + * Walk all slots and return true if @watch is present.  If @bloom
> >>> + * is non-NULL, record observed non-wildcard addresses in it.
> >>> + *
> >>> + * Per-CPU slots are examined before overflow-list slots on each CPU
> >>> + * to preserve the acquisition ordering required by the promote path=
:
> >>> + * synchronize must observe the per-CPU slot release before the
> >>> + * overflow-list entry can be missed.
> >>>   */
> >>> -static bool hazptr_value_present(void *val)
> >>> +static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom=
)
> >>>  {
> >>>      int cpu;
> >>>
> >>> +     if (bloom)
> >>> +             hazptr_bloom_reset(bloom);
> >>> +
> >>>      for_each_possible_cpu(cpu) {
> >>>              struct hazptr_percpu_slots *percpu_slots =3D per_cpu_ptr=
(&hazptr_percpu_slots, cpu);
> >>>              struct hazptr_overflow_list_flip *overflow_list_flip =3D=
 per_cpu_ptr(&percpu_overflow_list_flip, cpu);
> >>> @@ -244,10 +304,14 @@ static bool hazptr_value_present(void *val)
> >>>
> >>>              for (idx =3D 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
> >>>                      struct hazptr_slot_item *item =3D &percpu_slots-=
>items[idx];
> >>> +                     void *v;
> >>>
> >>>                      /* Pairs with smp_store_release in hazptr_releas=
e(). */
> >>> -                     if (smp_load_acquire(&item->slot.addr) =3D=3D v=
al)
> >>> +                     v =3D smp_load_acquire(&item->slot.addr);
> >>> +                     if (v =3D=3D watch)
> >>>                              return true;
> >>> +                     if (bloom && v && !is_wildcard(v))
> >>> +                             hazptr_bloom_add(bloom, v);
> >>>              }
> >>>              for (int i =3D 0; i < 2; i++) {
> >>>                      struct hazptr_overflow_list *list =3D &overflow_=
list_flip->array[i];
> >>> @@ -256,11 +320,16 @@ static bool hazptr_value_present(void *val)
> >>>
> >>>                      raw_spin_lock_irqsave(&list->lock, flags);
> >>>                      hlist_for_each_entry(b, &list->head, overflow_no=
de) {
> >>> +                             void *v;
> >>> +
> >>>                              /* Pairs with smp_store_release in hazpt=
r_release(). */
> >>> -                             if (smp_load_acquire(&b->slot.addr) =3D=
=3D val) {
> >>> +                             v =3D smp_load_acquire(&b->slot.addr);
> >>> +                             if (v =3D=3D watch) {
> >>>                                      raw_spin_unlock_irqrestore(&list=
->lock, flags);
> >>>                                      return true;
> >>>                              }
> >>> +                             if (bloom && v && !is_wildcard(v))
> >>> +                                     hazptr_bloom_add(bloom, v);
> >>>                      }
> >>>                      raw_spin_unlock_irqrestore(&list->lock, flags);
> >>>              }
> >>> @@ -276,7 +345,7 @@ static bool hazptr_value_present(void *val)
> >>>   */
> >>>  static void hazptr_drain_wildcard(void *wc)
> >>>  {
> >>> -     while (hazptr_value_present(wc))
> >>> +     while (hazptr_scan_walk(wc, NULL))
> >>>              cond_resched();
> >>>  }
> >>>
> >>> @@ -309,12 +378,16 @@ static void hazptr_scan_do_cycle(void)
> >>>      WRITE_ONCE(hazptr_wildcard, scan_wildcard);
> >>>      old_wildcard =3D flip_wildcard(scan_wildcard);
> >>>
> >>> -     /* Pass 2: drain the old wildcard. */
> >>> -     hazptr_drain_wildcard(old_wildcard);
> >>> +     /*
> >>> +      * Pass 2: drain the old wildcard while collecting observed
> >>> +      * addresses into the Bloom filter.
> >>> +      */
> >>> +     while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
> >>> +             cond_resched();
> >>>
> >>> -     /* Complete waiters whose address is no longer held by any slot=
. */
> >>> +     /* Complete waiters whose address is not in the filter. */
> >>>      list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
> >>> -             if (!hazptr_value_present(w->addr))
> >>> +             if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr)=
)
> >>>                      list_move(&w->node, &done);
> >>>      }
> >>>
> >>
> >>
> >> --
> >> Mathieu Desnoyers
> >> EfficiOS Inc.
> >> https://www.efficios.com
