Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D62EB872;
	Fri, 30 Jan 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768168; cv=none; b=j1WwGCZQ005OJzm/+dGS5vXR364TbSxcPob9WIcufGE8Som2eIjd/W3hALOEmpzcsqJ4btpyXSHKqHQyH8ReqbuP7qdv0/sEyDqtmpcn4kztGG5p8euVXqf5e8rVIuS/YO+dAbs5qzMMbjEMS+wPO2haTs9nw9K9VuuwXpBV7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768168; c=relaxed/simple;
	bh=senPl96VoP9NMbSYHN6CrZfoExUF5LHDmLR/j/T+dnQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KTieHh34wx4M5H0rQ61XxQxEZvwVMq2g95yOMQJgg9UTDVbMRtqUz0gubXGL4ndJ4nd/1Rpzm7Q6LTwfl8ifLQxBCYJbDIFu32Mv0vTCRxlYp29KxDZc7uNg0Y4mkbOh4vabBkgapxshD5HKyEE3rW/4Z5dmh35HxOI39sCvTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNo1C4Vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNo1C4Vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70AC4CEF7;
	Fri, 30 Jan 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768168;
	bh=senPl96VoP9NMbSYHN6CrZfoExUF5LHDmLR/j/T+dnQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=LNo1C4Vrnx+Zr3b0dCaO3rUUayS6Rd7uMIEPp2GVFj5Y9QDIzX/ThDpngyYaM+hgf
	 Ty4FWKpTZZ2IBBncUjV/pS6MPTEYvHy88AwzB4d61p/sLl1uRlColsFuy02AbGn6kT
	 tGGbC5SCsJGeXTx6XtmOXTFntb77EJK6r+gpcAWiIvxq4jOBUu9to236YpzorD5/Y9
	 MMUMph+ZByQpmPvOj6rEx97cK4ntIKJpp6Fjqc6fnwEoIvdzSozTq82M5VSXBF3if4
	 VYjcfhQNWPdPnb7b0Y5vM/dfFGqiXAGKkRKkaSqMR+A0xvgnfClOg04m+pjJXPyOMu
	 M4dF7l2BRqQ4A==
From: Thomas Gleixner <tglx@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de,
 akpm@linux-foundation.org, charlie@rivosinc.com, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 09/14] entry: Rework
 syscall_exit_to_user_mode_work() for arch reuse
In-Reply-To: <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
Date: Fri, 30 Jan 2026 11:16:04 +0100
Message-ID: <87o6mbl82j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29 2026 at 17:00, Kevin Brodsky wrote:
> On 29/01/2026 14:11, Jinjie Ruan wrote:
>>>> - * Calling convention is the same as for syscall_exit_to_user_mode() =
and it
>>>> - * returns with all work handled and interrupts disabled. The caller =
must
>>>> - * invoke exit_to_user_mode() before actually switching to user mode =
to
>>>> - * make the final state transitions. Interrupts must stay disabled be=
tween
>>>> - * return from this function and the invocation of exit_to_user_mode(=
).
>>>> + * Calling convention is the same as for syscall_exit_to_user_mode().=
 The
>>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepar=
e() and
>>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
>> Perhaps we can just delete these comments =E2=80=94 at present only gene=
ric
>> entry and arm64 use it, and nowhere else needs it; after the refactoring
>> the comments now seem rather unclear.
>
> Agreed, the comments are essentially describing what each function
> calls; considering how short they are, directly reading the code is
> probably easier.

No. Please keep them. There is more information in them than just the
pure 'what's' called.

