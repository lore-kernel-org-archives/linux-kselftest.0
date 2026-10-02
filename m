Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6C4E0201;
	Fri,  2 Oct 2026 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955063; cv=none; b=DTxzFpQvdjOlBcV3g4VXyCEvi79Swir7dmImLBxzLguWcSgiuh405SGVb23iX0hcpH4ljOlwCn7spjyjqLQsDlBQo7hCl868gJyqQbPncQP6L21sGZyJNxiwmRDSY06rpcn+f4+iGlKmn367dWLzuJhZJhiR8pGWYpVJT6ReJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955063; c=relaxed/simple;
	bh=Pb13iu/ycKWAkdRHfpejdosZI4tN8vnTY/uxCyS27bM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pyU0hl8VsRwhVzNRyIoAeq0PTuGhcMCdvkiocOSA19NBuh53SSvLdW/fKibQ+MvmCFGuBW2fTcI7j3PbKetnRx4hBwBg3lvpCWfCeI8c/mTQSfuiuTbXHtmab8tYK2emjrEyQueZBkaVS4sKpEL6fBh0ee/MHDbWAcd6AEjGm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LisVuhUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LisVuhUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB561F0089B;
	Fri,  2 Oct 2026 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790955061;
	bh=FM46s7EZHf9rjPe3C/H2Iwd5auI7xyJp3MB2IECp0ho=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=LisVuhUSLhz+urRjxHr6NsNKYrx87ScEV34+0VLtsW3wJqHSdB6ACvJ095H5VeWry
	 JrqJW2nNSYuz0ZPWKQ2cor1eBHR7SjeUxy4DN40hqe1D74XwkBi0JLqvHRJD7T6ShI
	 UTlDX4XZNWSESc1lgBsC9iQt8QEqNeje2CD3g2Nx9PZiHW4ynmgcVvANjSfSnzfW5J
	 C8M3bCv3si8TdhEjpwsDq9gaL4ID5pn19TREKKzgi07nP2kMSpL8BhA9LdJ5u4pUQS
	 DT7IbrEytq9aWUchh0PPHroIfIrs21bIKc5Vkb21/iCGUwigfO+LK1MNnYFWGyLokp
	 w07gD7XYFmSiw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id AB9B8F40070;
	Fri,  2 Oct 2026 11:31:00 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 02 Oct 2026 11:31:00 -0400
X-ME-Sender: <xms:NM6_atytbD83DGgfaD1Q1CcslokR6Pj-n_h5dzYAicQqa9-MI1Hirw>
    <xme:NM6_aoGC2I9kIMsc61zs8wFxMbGHErGGUz-hb0nZFCrmpzYVRto6ygxddgkc8PpeH
    esULfrXmtFRbYSL1UkSH5ccdOhxqYXXUKzx8KFeNN25VAzOcynppEGl>
X-ME-Proxy-Cause: dmFkZTE9FKj1pbOY3LhbPOpFELVXU2Q3bWSI+vpgSj73A5PqvFGYZmhx6HM+L8S0/FjHKy
    6E9V1Qzzw9j/iNff7ngpCgWfCRydKj8okCMsXVoRZjuPwiN79HE6Kppi8VQgHz9R7eCHys
    +QgfT1HOZ1zEqMA8LKKAWBRdWgIdxGphpBf4JgiKxglT9PdntcZeAl3M7yw6H1/uYi2uJB
    auB18R2j+K5UnQ1+inIlQfyRW0vcQF5TeoW89Xq8KhfJGeiDW5xxa9WyqxMjaoZ0mWx78B
    2/r9PwsOEwHCtV9FVfaCWqPnyBhuFaCc0L8YGbgWcWlMX/ol0m0FzJz12rs8w9RDwATgM4
    jPO3b71m6Gd8HRGdY9xzn+j7pAJkdrOD2uOcT02B1TL0x6mJ4ZFMgvbcPxhUYvK90Fl+Kl
    L8XVKUPriWt82AafO2LoWp805/FQYoLGoS9WvU+lbNnstliORvWFcO8ry2MFZefaqNIfyT
    p1N1kO8CXhKhsRKrQ8SuhJb3Rdr3aZwWR335p386nb/+VfgVyyhnP+R76ld6+BbtWzRFII
    iTwRwxVltxyT0//18HlgpkdN3+7sTQcsHwAN6KJDOm/PD8+ZKtw3ZAAIrCa2yaj1om3hzp
    +pqoVHbCF+CXGNovMhMLwClyijiW/bL9RvWpfKIUC6y74ntgq0hJLB+pr7JA
X-ME-Proxy: <xmx:NM6_aqlEWlwAHtMGTPNR2tu_aT-yyWN8ATYYC0ew8ZBh8NubED8Glg>
    <xmx:NM6_auhdlVMMdYUSWJfTuu1oK2tPiJvTybpI8nMp4KDgpZ4Dj8iszw>
    <xmx:NM6_ashOxQQSQ39-Ie802JcsXOxgZTbixs7l-RMVCV4NXxI5Vov4fg>
    <xmx:NM6_aosu8Prmr86xuNRpK_LCoEsEdy37deXrNZgRhC9R5xLJ1CPi0Q>
    <xmx:NM6_assAsNu0s0ho9NHJRUfnp1VK_W0ynvu1U-u-E_7o71n-jTe8dUwT>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 86938780070; Fri,  2 Oct 2026 11:31:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A7lo7qchVSwF
Date: Fri, 02 Oct 2026 08:30:40 -0700
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sinfo@kernel.org
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Sabrina Dubroca" <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, "Qingfang Deng" <qingfang.deng@linux.dev>,
 "Eric Dumazet" <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <7109b48e-992f-4f67-a036-cbebf74cedcf@slotpi15m67>
In-Reply-To: <179089471115.1402591.14877215785916752547@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
 <179089471115.1402591.14877215785916752547@kernel.org>
Subject: Re: [PATCH net-next v2 0/8] net/tls: Receive-path fixes for zero-length data
 records
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Sabrina reported the splice(2) false EOF fixed in patch 3 while
reviewing commit 3be28e2c9cd0 ("net/tls: Consume empty data records
in tls_sw_read_sock()"):

https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/

Sashiko's review of that patch flagged the same defect, and also
the rx_list growth under MSG_PEEK fixed in patch 5. Its review of
the read_sock series I posted on July 20 flagged the missing signal
check in tls_sw_recvmsg() fixed in patch 2.

The defects fixed in patches 1 and 4 were found by an LLM audit and
review of the TLS read code paths.


>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

None of these was hit in production, so there is no stack trace or
error message to include.

The selftests in this series reproduce these two: On an unfixed
kernel, splice(2) returns zero when it reaches a zero-length record
(patches 3 and 6); and a splice from a nonblocking socket without
SPLICE_F_NONBLOCK sleeps until the harness timeout (patches 4 and 8).

The fixes in patches 1, 2, and 5 have not been reproduced because
these need a peer that streams zero-length records without pause.

I'll update the commit messages I'm carrying locally so subsequent
postings will carry this information.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
