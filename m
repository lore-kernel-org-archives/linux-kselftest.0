Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B077295D90;
	Tue, 20 Jan 2026 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950671; cv=none; b=ud2QDy0EZrDZUidtfHrMICX3mwRPWGB80Xo+CjYrlkzPGn0syu3hZVmpD8tbA/sA2LfcrP3Fvu0hLC4WzwEAZOqICN6Q0aOA5RxVzxiliDtbHFdxC+576ruZaXEtkRYhdDaWSBF2z+wvsF5WtFgj7teCFCT2LPK2bOGxEplAuKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950671; c=relaxed/simple;
	bh=4OAnhlH8k8+q57RHieNYUIbjWJc/7roTluxCSljmPf4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KSo+qyD9jlfsVLQcvkTdvXz0tKW0+eIcVL08tFe1T1Hlj9Utc/C1DLOChcZ+meK0o/OqwlMs39yUvgHiJoIdjIdywP0jymKg3tLGlo9CeDjzeex3ntkUts2XWZKFEZVM6N63VEx2S//9lvyBfPAME3O2GITord8aVMFr4LubDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJjP99IG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJjP99IG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F9DC16AAE;
	Tue, 20 Jan 2026 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768950670;
	bh=4OAnhlH8k8+q57RHieNYUIbjWJc/7roTluxCSljmPf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZJjP99IGnJghU1B294rhqzumGSL/bURI3IeJD29HGcpmNNdvHzqaog5zn9FfaPnXC
	 /vgNMn79YYq4S+lmFKWrvT89wHGvkqKXIGuIOiAc5dlqxfAC2CgdHcak40ZynplFNe
	 GugLxaAPPZ6tPHAm1SU4C1TDEku8kbEviDOSEyee7+1fKkNKk85JXUz0cP6F2HedOE
	 roU60JvQkvPHwaqJONnblnqdH883/e349wka1o12Vg0kMIjmHoy9bSkdb6E2ZjTQIV
	 w9Z2kVUisuQfAIWYO53YVxhsPR/L5Gwxe+r8ZpVr5ywRPX+rD9tV5oxnNj2NZoJ3R3
	 Uorp9QAk6HJNQ==
Date: Tue, 20 Jan 2026 15:11:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org, Jay Vosburgh
 <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Simon Horman
 <horms@kernel.org>, Mahesh Bandewar <maheshb@google.com>, Shuah Khan
 <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Liang Li
 <liali@redhat.com>
Subject: Re: [PATCHv2 net-next 2/3] bonding: restructure ad_churn_machine
Message-ID: <20260120151109.2d483bd8@kernel.org>
In-Reply-To: <71e30492-7644-4d4f-aaab-9a505f8faae3@redhat.com>
References: <20260114064921.57686-1-liuhangbin@gmail.com>
	<20260114064921.57686-3-liuhangbin@gmail.com>
	<20260119122203.5113b16f@kernel.org>
	<71e30492-7644-4d4f-aaab-9a505f8faae3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Jan 2026 09:29:14 +0100 Paolo Abeni wrote:
> On 1/19/26 9:22 PM, Jakub Kicinski wrote:
> > On Wed, 14 Jan 2026 06:49:20 +0000 Hangbin Liu wrote: =20
> >> The current ad_churn_machine implementation only transitions the
> >> actor/partner churn state to churned or none after the churn timer exp=
ires.
> >> However, IEEE 802.1AX-2014 specifies that a port should enter the none
> >> state immediately once the actor=E2=80=99s port state enters synchroni=
zation. =20
> >=20
> > Paolo, how do you feel about his patch with 2+ weeks until final?
> > The first patch is definitely suitable for net. If this one is not
> > it should not have a Fixes tag. I'd lean towards getting them all
> > into -rc7 if we can. =20
>=20
> My personal preference would be for 2/3 landing into net-next: the code
> looks correct to me, but refactor has IMHO still to much potential for
> regressions do land directly into net and the blamed commit is quite old.
>=20
> I suggested targeting net-next while retaining the Fixes tag as we
> already had complex fixes landing into net-next in the past.

The appropriate way to delay propagation of the fix to add:

Cc: <stable@vger.kernel.org> # after 4 weeks

not to merge things into -next.
