Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E128FF513
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151576; cv=pass; b=TkKEUPSZxa4mpxZ4gTShLNDXM2JcWLiQHudIATDfcnNIYDVab27wJmwSe6BtOhzFD6+M0fzKiiZ7+8++JWvt4fJXxOAV83ai0CWhdJmxZ7D+Qo0CA6DPJ4Xoayn1GThWqXSwQgnwBXRp1oToEBbdbRDsP39w1TykkIudKNMQPaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151576; c=relaxed/simple;
	bh=Q7OwuwFj7g4WIG1A265nsQSz8PIxVCvFg2hsp1EQeuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMY1aloNruFWi5fhrPKXm+IWMapMQowbj9X0AGGDimN95KG4U1N6y2+nd56vxnK5dCX5voRK7eK4WtL8VAgSU7DWYYqegb62XHZuBa7hZymhNgi2v5ecX+BrqTFrpOOtvipHt2N9Jr4xocQWwvuriENL823K7dJJswVDYUXY2W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooyFdnY1; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooyFdnY1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so230a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 12:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770151573; cv=none;
        d=google.com; s=arc-20240605;
        b=ixDKDT+reOi4tpzzXzAMsmQfkhGylBSYje05pR4FzUghUFr6yqNj31hbtaohXo3HLz
         Yf/Wogjn+/TdkSjzn6zG1PPj7WMXI/kYAyR4gEBxQ0S5/JNeqMfBUH4/fFWTptA1EWwj
         yCtsWAMOBFshVdO1aiEvP5Sm9t2kPjuMk3KcwHNxag0CYz250jbkT8K+HSziNZCtqE7Z
         ZYk0xN+C4nvAG60YWn1Z2X841Bx3eSh0KJPKQbJHWHYLdba+wy4SWzcDh2oLQPnqJ4af
         x/j37FO5EcsIoF9GIU3njcaC2ia9pkvFB76mYtih9DTwvYX3aXReqqa+72aSgpaZc2CC
         lFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UXUxBXB30px7Qxjr7Xjdulu2/5KTCIkLZZ0qQGNc3DI=;
        fh=BqZhyl4N5x3VV4ne8ElA0yJXQcfK3Q9ozWyGjA4D14A=;
        b=E3RB4JXUwnpRh36JB8jl1CVAXE2FGjWT7Yu834JIe5+f2ObPdcjzU2UKL6gq13me5N
         V7RnBUFC4tj/nQdQNQk8b4rqcS3KZ8/+F2knJa2UcA6SN1WHbL9w7G4Bk3ZkJIkhVIlQ
         M1bp3PEwpJCF7oVE4dTuXPvcdNFnFr/AYBIXm6zwULJ0eeN4mJdt0YAIsB0agwPu0PLG
         7wGQqsb3f/+nbOvmvzpjL14Rl7dx6Q2tKgSrWHQDkkD9Aii7S7NSLiGXrn51xRzAlH+L
         4KsIMqx5NjDJqHC+IbCwRVhiEk5L2wcOcZxfPvVmZ7tNMiXED4JoPBP8k+6etfsFPx4q
         E6xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770151573; x=1770756373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXUxBXB30px7Qxjr7Xjdulu2/5KTCIkLZZ0qQGNc3DI=;
        b=ooyFdnY1e+9GoqOpIwTgS1gcgtULscsQkBPkOcPLLpS5YifxKIlfBmWMhIGK302E+I
         LkAjzl9jkZW77eBvlQXd/vmJSj5e4YvMi39XOhmGDaoxKob9gREEpDt1y4Ia+gSHqrmi
         zaY9ehvEhlhUBcBR5+ifth58C42VEIBfwoibzKHVKSbKlROzmvIN/SiqIOPluz1NYZxn
         OSkeauiHP7dsQuMnxKG7997Ckldvg1OkmldGaY22zuYT7gKEhjFkeDneI+fAe45URp10
         dX9IQGDaaNgutQLj1ZBHaalxb4m+Iug4rPoknwa93J/LvwCCQ/sx2wYs9hHW1WBAbxnW
         iaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770151573; x=1770756373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXUxBXB30px7Qxjr7Xjdulu2/5KTCIkLZZ0qQGNc3DI=;
        b=jMhOlH/uxIbrQHUCVdWwZdVUuCNu5Mi9CFXow2bvJkysxOTyWUtc4EgYBaQt3LrPa9
         pwwpp9Hl+2uN673E1F0SJsnYhUQBUiXZLs4C9tJw84XzjoHy0YngeoTL1Lpqnlkm7C+S
         L0OCaXwG9EUSWX/uXS+YbbQqm18pRoM14Y8FZz1w4sSB8lXeL2ssl+SYggZcZ1zOmN8q
         lSfSCvIFsZkdcylJHF35GkayUzDPhMh3kjmci+Vj9lRi42n6Ae/dVz2y3ga5PDipefx1
         dGh/J2rrn3YtQo5dus3N8bm/VEFW+y4VPTL6ssI68Kf75gU+eN8MemdNdlRPK7slirmv
         YRbA==
X-Forwarded-Encrypted: i=1; AJvYcCXFKVBolfdyJU4VU3xLkCaMm+ZOJH7yYiwTHKEGHn9wKv4gY0YJM2bKf55iX0ITnwGfHWMm7aj8SVLsddOSsj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Xnu9t9Z1vAR6A5SqCMy5rBg7vGeyltIzy6+0NItNsi9eV35c
	ad5id69rxrA4uSN51TVrz/Yuw9wD62+KgDz70bRUN8Xz7W/6b/l3BpJaSOlqtM4WPBYnqHNQdqb
	ZQTR3qekn455Fu9hq3uuze4f+ZU1Ne6b6E9hoq1kT
X-Gm-Gg: AZuq6aKyj4tYPG7iESkjgdzWi1xMsuBBeuDsvh+BrKUqc7VW5K/lh1zFvnv8p2VC6gO
	dK5bxXuzn1kEHT8BwGwCkDUeN15HtZy3qUvhVxKNn7YksIuKLotiF3n7YgKNeh6xMA0ii68dMKt
	E8RGlYe9EP0FPlE0Ia15Qm4E2Bps+S5S1vZz0yrvnQrPnycTjvu3S7wF/TmPCuiL06pM0wWcy8l
	V83am1TTepKkDb+mDTAxH+cFGqSly7zFbBS9BLoX8Gk5Vyc9WSPzu/SW1SL7acxj+pu0/8=
X-Received: by 2002:aa7:c508:0:b0:64b:2faa:d4e8 with SMTP id
 4fb4d7f45d1cf-6594cc84926mr251a12.1.1770151573037; Tue, 03 Feb 2026 12:46:13
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129232835.3710773-1-jmattson@google.com> <20260129232835.3710773-4-jmattson@google.com>
 <zzgnirkreq5r57favstiuxuc66ep3npassqgcymntrttgttt3c@g4pi4l2bvi6q>
 <CALMp9eS7Za_vFdh8YBzycV2g87gZ9uj_S1MOYrgJ1+ShwVVWZw@mail.gmail.com> <626dbe6541266f61e8b505202cf49c94c4fee12e@linux.dev>
In-Reply-To: <626dbe6541266f61e8b505202cf49c94c4fee12e@linux.dev>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 3 Feb 2026 12:46:00 -0800
X-Gm-Features: AZwV_QhrunzURc9V5Pq5tiKjnsYeNR99YAZkjlUEbz7G1F7PnzNGzpkU8X6_T6E
Message-ID: <CALMp9eSZX9UQhu6iv24Jj9zUK+NVuiHAeHxsMDSgjP2skA=QMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: x86/pmu: Refresh Host-Only/Guest-Only
 eventsel at nested transitions
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mizhang@google.com, sandipan.das@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:41=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> January 30, 2026 at 3:30 PM, "Jim Mattson" <jmattson@google.com> wrote:
>
>
> >
> > On Fri, Jan 30, 2026 at 7:26 AM Yosry Ahmed <yosry.ahmed@linux.dev> wro=
te:
> >
> > >
> > > On Thu, Jan 29, 2026 at 03:28:08PM -0800, Jim Mattson wrote:
> > >  Add amd_pmu_refresh_host_guest_eventsel_hw() to recalculate eventsel=
_hw for
> > >  all PMCs based on the current vCPU state. This is needed because Hos=
t-Only
> > >  and Guest-Only counters must be enabled/disabled at:
> > >
> > >  - SVME changes: When EFER.SVME is modified, counters with Guest-Only=
 bits
> > >  need their hardware enable state updated.
> > >
> > >  - Nested transitions: When entering or leaving guest mode, Host-Only
> > >  counters should be disabled/enabled and Guest-Only counters should b=
e
> > >  enabled/disabled accordingly.
> > >
> > >  Introduce svm_enter_guest_mode() and svm_leave_guest_mode() wrappers=
 that
> > >  call enter_guest_mode()/leave_guest_mode() followed by the PMU refre=
sh,
> > >  ensuring the PMU state stays synchronized with guest mode transition=
s.
> > >
> > >  Signed-off-by: Jim Mattson <jmattson@google.com>
> > >  ---
> > >  arch/x86/kvm/svm/nested.c | 6 +++---
> > >  arch/x86/kvm/svm/pmu.c | 12 ++++++++++++
> > >  arch/x86/kvm/svm/svm.c | 2 ++
> > >  arch/x86/kvm/svm/svm.h | 17 +++++++++++++++++
> > >  4 files changed, 34 insertions(+), 3 deletions(-)
> > >
> > >  diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > >  index de90b104a0dd..a7d1901f256b 100644
> > >  --- a/arch/x86/kvm/svm/nested.c
> > >  +++ b/arch/x86/kvm/svm/nested.c
> > >  @@ -757,7 +757,7 @@ static void nested_vmcb02_prepare_control(struct=
 vcpu_svm *svm,
> > >  nested_svm_transition_tlb_flush(vcpu);
> > >
> > >  /* Enter Guest-Mode */
> > >  - enter_guest_mode(vcpu);
> > >  + svm_enter_guest_mode(vcpu);
> > >
> > >  FWIW, I think this name is a bit confusing because we also have
> > >  enter_svm_guest_mode(). So we end up with:
> > >
> > >  enter_svm_guest_mode() -> nested_vmcb02_prepare_control() ->
> > >  svm_enter_guest_mode() -> enter_guest_mode()
> > >
> > >  I actually have another proposed change [1] that moves
> > >  enter_guest_mode() directly into enter_svm_guest_mode(), so the sequ=
ence
> > >  would end up being:
> > >
> > >  enter_svm_guest_mode() -> svm_enter_guest_mode() -> enter_guest_mode=
()
> > >
> > Yes, that is confusing. What if I renamed the existing function to
> > something like svm_nested_switch_to_vmcb02()?
> >
> > Alternatively, I could go back to introducing a new PMU_OP, call it
> > from {enter,leave}_guest_mode(), and drop the wrappers.
>
> We could just call amd_pmu_refresh_host_guest_eventsel_hw() every time we=
 call enter_guest_mode() and leave_guest_mode(), which is more error-prone =
but there's already other things in that category.
>
> We could also call it from svm_switch_vmcb(), which will add some calls t=
o extra places but I assume that would be fine?
>
> I personally prefer the former tbh, as it's otherwise easy to miss.

I'm not a fan of replicating code sequences. Maybe instead of a new
PMU_OP, I could introduce a new KVM_X86_OP, which would be
conceptually more general, even though the current usage would be the
same.

> >
> > >
> > > [1] https://lore.kernel.org/kvm/20260115011312.3675857-9-yosry.ahmed@=
linux.dev/
> > >
> >
