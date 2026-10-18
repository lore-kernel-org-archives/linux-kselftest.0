Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4C1F30BB
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284055; cv=none; b=VnblsKm770pDH3zYrmtSWDHxmsRfnMgu4pV0JufOTfY91B2ZvJRxADW5jwOQR7IqpI2yJZ2cswV6vpRTd2wxjeVz2V9kCOHCMeSdaMuZRqaMjSefLm24Hh3G+Oh7W636BfZZ6rkMRf3Y+hX/J33mDLOhklPfHJEW9wKcN8W122w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284055; c=relaxed/simple;
	bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rtfk0O/UaqwCUpisvJjziw6L5oETcCHKVFGXRqq7PxJA2dkw+GZhiVMMg0V/ZRuRJ2/yovOEl1CpDp+RWueSCO/cLbgijkIrl7etKEp/MuFEA02366T9XW8WL6DkleU9e8zX00YC7XNDYR5hd5q6pOFyDFpcOb1qwrHdRrdpzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6Pb51qe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6Pb51qe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987b4a710so9161665ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284053; x=1792888853; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=Y6Pb51qecalWrz6sg8Uw/H7mpl1GIbqXIak8P7izZ4db21ckaYfML8KVzc/EEO37vE
         hr49r3ukY6aDlmXYLU3MU37TLlsPSiWFYwoUgEaOGqmU6EMkFfZ1GANlqaXzdPsOjM0t
         tFC/6+GGbMj0bgcUvFS7TGBNRIYajBzndBlj64XN3Vp+F2MDqTpQnII37EFdRfQFv6Zp
         oqF3ipjPUkVJVSZd+z291g6KxFpx0OB1QwRPFbHzgk6fIFRAhYYG0ddDdRRnhQLK5H4W
         6TyFD9R0U3rZbYeQdxD3hgn0kHNBJLbBGvaKw09o0K7VZcaWsX5uxlmOe3EAYDlDm1dj
         QkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284053; x=1792888853;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=zprWX/RXp5cmkNWKU78cCzYsin+qreJ3UKnj9UE/NNqo8iShJUX4ZvBi7UUQsFLlG3
         WvpUxXnMIwoaRMuA3u9KhXePuIpnq21HQrq0sjJLtRNQd9VUTnpKwhtsSRdnMFUJyNHu
         uMnH+UuFU5EuAPB9HYpjVx7pD8kwqj0sVO0r/7WIu0Sie5M6dezXG84bfy4f3oRwMHDx
         M24cWm+7f3S+daQE2HABsCUYgD/GD5C8D+uTwQVqDx6lZwegXOsPZ7n5bzt9zQob+Mvd
         wbjmLkKXniyw13m/kpBeVBeso+2DVR9zgbBMzQJCKUL5Axp7yWwuUXRdqDnqKBEsbMPy
         WQng==
X-Forwarded-Encrypted: i=1; AKwUvBwz993c5mq6sm85mUP62+mEB8v8H/Dtvx/Qxr6xUUi0dpWMZrVYX7+dJpWRL26OQZnfLVm6qCjcwVogOSl/RGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH6tTMrPKIXXi+idScgHPABpq2sfK6ZLEdOM2AiihG9g1GDxl1
	Cj8ttn1SL3ytf+FjOVxnzHT1bV3iG6UfZJP5qoRg1SJVS32vp9IqMexo
X-Gm-Gg: AYBFou1KsfMyHn2yPpX+Qf3ZZ1p3pnrOf+OQw+XXC3zshvFFZnrz5xY2hZrLwaJ0YM/
	aohcE12H0t9RmzK3yW9bCT1Zyi1SQWWjzx3nPJgWYOponlWZGR93A6YpzrAXhh/ks4DULs7tZFW
	3OOiZtdhHSOaCsNqiAoAAF+481MmAcDdRx+cd5VM327Hrb6jE4xZUOj7TCxQGnfo8YtWYpRZDl3
	U4yWxK9J7p1hw//+haBC5QM7y+Co1VPjSFLOBdpcABdiJQFvT0wIV6Cca6peQ6NfgffIh/JMY5Y
	d1C6dhZrMdrzl8og+VHgELYNLfIH/lKz0yIm8tVH4MsJKBob83thOAhpnnGAxXrcClTrqO05H1k
	EzTLAhDmSucsdYbx0M/fBBt12tMvxlqhGJ+MDy0mGMCNHxRR41ioJvH0OkQ9zK1BbxUpSUhdzf3
	6m0FO7mbDhebS0zH/bv0FySoE8q1t4xdTgXvHrHndm87rT7BpcHRvEsnPNxuYH2vxiLLTG3otb1
	R1xXqw1W8/kH5e9OHn5ziN3mrHRPyZ/gXkhofjP4CKktvSXDrmWT9mYjeM272LyvHeBGozLRHfy
	Jt4=
X-Received: by 2002:a17:90b:48c5:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3acef4e131cmr2448674a91.30.1792284053166;
        Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm14830794a91.15.2026.10.17.17.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 17:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 00:40:51 +0000
Message-Id: <DM7JO6OZIF73.153P5K24I3ZWU@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <shuah@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
 <morbo@google.com>, <justinstitt@google.com>,
 <donggeunyoo.kernel@gmail.com>, <leon.hwang@linux.dev>,
 <menglong8.dong@gmail.com>, <yatsenko@meta.com>, <jiangfeng@kylinos.cn>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <vineet.gupta@linux.dev>,
 <mykolal@fb.com>, <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v2 0/7] selftests/bpf: Fix selftests failures
 with LLVM 23
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "KaFai Wan" <kafai.wan@linux.dev>, <patchwork-bot+netdevbpf@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261014113043.640435-1-kafai.wan@linux.dev>
 <179211120751.4176565.4973025143783418812.git-patchwork-notify@kernel.org>
 <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>
In-Reply-To: <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>

On Sat Oct 17, 2026 at 12:57 AM UTC, KaFai Wan wrote:
> On Fri, 2026-10-16 at 00:40 +0000, patchwork-bot+netdevbpf@kernel.org wro=
te:
>> Hello:
>>=20
>> This series was applied to bpf/bpf-next.git (master)
>> by Alexei Starovoitov <ast@kernel.org>:
>>=20
>> On Wed, 14 Oct 2026 19:30:36 +0800 you wrote:
>> > Building with clang/LLVM 23 breaks several selftests. Patches #1 to #4=
 fix
>> > those failures.
>> >=20
>> > The following self-tests also fail under specific invocations of
>> > test_progs:
>> >=20
>> > - ./test_progs -t prog_tests_framework/test_fail -v
>> > =C2=A0test_prog_tests_framework:FAIL:skip_cnt_check
>> > =C2=A0unexpected skip_cnt_check: actual 0 !=3D expected 2
>> >=20
>> > [...]
>>=20
>> Here is the summary with links:
>> =C2=A0 - [bpf-next,v2,1/7] bpf: Determine freplace staticness from BTF l=
inkage
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,2/7] selftests/bpf: Fix stack_arg precision backtr=
acking log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,3/7] selftests/bpf: Fix stack arg pruning test JOI=
N log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,4/7] selftests/bpf: Use _exit() in uprobe_multi_te=
st clone-ed child
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,5/7] selftests/bpf: Fix prog_tests framework subte=
st count checks
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/c87652656a55
>> =C2=A0 - [bpf-next,v2,6/7] selftests/bpf: Skip expected_msgs subtests wh=
en stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/cc4b1c161d92
>> =C2=A0 - [bpf-next,v2,7/7] selftests/bpf: Skip compare_text subtest when=
 stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/7ebf808caa76
>>=20
>> You are awesome, thank you!
>
> Hi Alexei,
>
> I resent the last 3 patches in v2 and changed the subject, expecting v2 t=
o be reviewed first so we
> could skip v1. Sorry, it didn=E2=80=99t work. The bot closed this thread =
while applying the 3 patches from
> v1. Should I resend the first 4 patches?
>
> Sorry for the inconvenience.

Sorry. My fault.
Pls resend. It will be easier on bots.


