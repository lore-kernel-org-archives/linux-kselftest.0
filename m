Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46538657E;
	Mon, 27 Jul 2026 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183782; cv=none; b=BDY69iYK/sww2pjwC1Fa3PL/MUXOPhfg/UIQfsCSHMpc+ShaYklVD7CVOkX3HmJAu1OdmVdg9KKzgRdQZmZo/yd3IARSfb2uoXQezcaKLamsgswsupMlukD/FT1v3BbjgsE/iQEeGEMQILCYixOrtN/Gg6hjjmJaSzfg4IL5E1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183782; c=relaxed/simple;
	bh=votctQnCofjY0In2Pq1mYFbEIYNaXuazgSHVPTgfiVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeGdV2uJjDThJyyT/qG19SxCrHfwg8omGv1M4joqh5yfW5wX9NVVVucRP6Cnp0UtcqRCfiH8/PyIOuaFDFenmX32IzE6Wa5XCe0uL3wczrZ05ljYRqXK26CSlRG67iFj01pgct1A1Pt7sp+knSm/9E9SEOocuTeDVlGBYeVV5qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jogA9IJw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jogA9IJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664041F000E9;
	Mon, 27 Jul 2026 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183780;
	bh=r5NfpF/C90nCcZglrZgOIv0WsurggaPs3TMLtwy+Uh0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jogA9IJwyuBihqIuTf0CyZXQYWdGyVvMlVp2eHg17CFzikVQ8Q7HZC9z58qXL5aH8
	 XtvIbKh964lbscvI02havinXpH3SD1kEi6pfm3F/0R/NL11F4UZx1B6C99aIAsvgiD
	 d7Q1Lvzj/JAE418EwMiKeDwq30Cpu052C5wCMbmhZrYFLg09KAb/vigRCcPwW2szON
	 pilKhvYxyhwq+nHcZC9hkMc2DbCfRMYU7RbBEaNJdYxTMN5/GPoQaoYTPrH6Qwc8hH
	 DeghhRojcuilX2OtrSumibGPNWO96UxKSfjCr+3CMrD0nk5QvI+BP/iWe2ELJmXXWs
	 urw4w4uIZLYGA==
Date: Mon, 27 Jul 2026 13:22:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Simon
 Horman <horms@kernel.org>
Subject: Re: [PATCH v2 net 1/2] ptp: reject frequency adjustments that
 overflow scaled_ppm_to_ppb()
Message-ID: <20260727132259.3837774c@kernel.org>
In-Reply-To: <20260721014256.1876-2-deepshah146@gmail.com>
References: <20260721014256.1876-1-deepshah146@gmail.com>
	<20260721014256.1876-2-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 01:42:55 +0000 Deep Shah wrote:
> The caller already has write access to the PHC, so this hardens the
> max_adj sanity check rather than crossing a privilege boundary, and
> well-behaved user space (e.g. ptp4l) never requests such values.  It is
> a follow-up to commit 475b92f93216 ("ptp: improve max_adj check against
> unreasonable values"), which handled the analogous s32 narrowing but not
> this multiplication overflow.

Exactly, so I think this sort of patch belongs in net-next without 
a Fixes tags. Because _nobody cares_. Please correct me if I'm wrong.
