Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF9E2EEE65;
	Wed, 30 Sep 2026 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758289; cv=none; b=Rkz6qTiwOQEdUr0Jgjs/38FN6wsjaDQe7k5Xmbx84knpA/CLrVK9l1Zovar5/KkCoT1ILf2ZFf7HUz6Z5oAcKsC6DAe+ISAc86JyG7x7n3heOH5Bq4MEECh70VaJ6atxwWrYJkFqZtbr3zDqcB94Ot6q0Kw560gbkH62zpaNiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758289; c=relaxed/simple;
	bh=MZWTqZGizf2e4awlEik6xcTG3aUNk25jrVwdTTqUtAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs7PAEP6tpGhOzmMok0W+jZo4feO8eQb3fpDvYJ/DoLR27J+0mGvjnjaCLQLPbDWNVW4ewlsixEep/AccBJzuKyZBH8jq29KyC/jAFgpECVKI8bDAea1KvFNBmuLALJAcTXCVWtzM1TCKDWKtqdXGhBO6j1QmJI7zylhkPiNCQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JVZXWF9x; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JVZXWF9x"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57DBB143D;
	Wed, 30 Sep 2026 01:51:24 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 364523F85F;
	Wed, 30 Sep 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758287; bh=MZWTqZGizf2e4awlEik6xcTG3aUNk25jrVwdTTqUtAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVZXWF9xXQVk47nJJSaN6p+8Fx2fMXbO+4U8Qi17EeMFjFgx3/NeFEBN7ngYuVCiQ
	 hMpKiQeTtxY9JH+kfuWM5KCtGZtk2ZJRqF8Chhjo3LBcKavdBv93ov1Bon1ayAvCba
	 LIoeW37n7jkrQo01Y5Gs3B8lhR+sonKW3vnSMNV8=
Date: Wed, 30 Sep 2026 09:51:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arzNg0jxDmbEMrJm@J2N7QTR9R3.cambridge.arm.com>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>

On Tue, Sep 29, 2026 at 05:27:28PM +0100, Mark Rutland wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
> > When they detect corruption the fp-stress test loads print load specific
> > diagnostics and exits with a failure status.  In preparation for
> > building versions intended to run as KVM guests factor the exits into
> > asm-utils-linux.S.
> > 
> > No functional change.
> 
> This is a good cleanup, but I do think it'd be worth noting that some of
> the existing asm was wrong and worked by coincidence.
> 
> I did mention that in the patches I linked you to a while back:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Sorry, that was the wrong link; I meant to share:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=2db277185f5c252decdf49b25cd461782e890cd1

... which was another patch from that cleanup series:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/selftests/cleanup

The description of the problem from the commit message was:

| The barf functions in the fp-stress sub-tests erroneously place the
| status value into x1 (rather than x0) when invoking the exit syscall,
| potentially returning a different status than expected.
| 
| By coincidence, the low 8 bits of x0 happen to be non-zero for all of
| these cases, and the exit will be treated as a failure by the fp-stress
| harness, which is the desired behaviour. Hence this doesn't lead to
| failing tests being reported as passing.
| 
| In all cases x0 contains either:
| 
| * The result of the prior write syscall made by the puts macro, which is
|   a write of the two character string "]\n".
| 
| * The result of the prior write syscall made by the putdecn() function,
|   which is a write of the single-character '\n'.
| 
| In either case, the return value of that write syscall may be a non-zero
| number of bytes written, or a negative error code. As the relevant
| strings are fewer than 256 characters, and all (positive) error codes
| are less than 256, the value in the low 8 bits of x0 will not be zero.

Mark.
