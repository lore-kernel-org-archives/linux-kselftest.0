Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624825;
	b=XRjZbQ0Usgg7QAO77KpGqzSkczrhWw9gAWEoNIMQUphyTsDw2Pg8spz3gC7Naoigb07r
	 ZkNEx7+kqSTh8TVI5dC8TS6q0OGchaBVgUA8TaWpG/sEPmjEdzgCW0Ol/PZex6GvD37qb
	 eRxxzmltPqLa6ZOn7MF2Qw5RykKO6roqYIsn6y2I6tSWK7HdBPayKuLOsa9iiAeCWNhTU
	 qhsu2HC0mm5E/J1nhpmOa+lJHPB+kDohUvGMXGR9g4yh/VeYCBQOqw3vZVloZdbuZl8sd
	 OeuFI5TEvwdOZo4I5/DE920vot3FkiK0uHsFDTPPtAzpAMOg2doo+Ea8D4CpezsGv0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624825;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=;
	b=E5Q5XIc9tkZfb6/O+0+BdyZ8flJ0Rt4LyaKW7MyrBVGG0WvXpVDKtQGRlW6sSKtWvDmT
	 HL3439dqbdLkcFUU/3Ki3DJfNLcg+GP9NURfhd6LYGapd6yOLz8P9p5TMjw+TnJEqb9XT
	 Ml0eb97vGJ93AnoZpLzSCmzwMZHnGANUvFwNDFniNHNqD6MhK92eRsRR8rqNvvkAAGv2d
	 OMEb1e0+et9md0t3rzPumvarSBBubHMEB20Uv9D43aJytmKyiPrYdfmxv0uaco33G+I5C
	 vuGCLDugnLilCoHypjo4wQoT/wywt5Yg8Pe9x/tbuDt9FJTOoR8qJ9y73HExxqrFUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC8606A33B
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BC8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 25DEF7A0623
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:40:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 11:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795624820; x=
	1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=; b=b
	LFxljkf8085SNZFqKfvwrHAtqBoWplskS4EhTwcIOygIXlMpueYzouSuFbldC+sP
	uIsVUp5qryri8PYOAkXTiIofqD+z7hcVXLM6foT03VpU6o216TmvQvhwWEsRMeBk
	vpgbY/BxXgj0NfhvAXm5WGFf6O51stvBstlDJJryy2UvELQeENzebFaGcM7ULfJt
	/j/g7LTh3jnC8y2mshporPnkNlWpwxe7sp/qy7kjq20L4EfPujxKLjye1wAt1Pwn
	x1bXMevQWust2/xNGvbVvzlIx1EuyUm5u53M+ABMrVlgvFViIfMi+uRNEKqgR+IW
	HJ52SX+3wLjv0bLjTM4Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795624820; x=1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2Nr
	VmJtOzk0=; b=3yATzR9kKoed0T8n2E4dRzPtrHf/ieP926YExKWer2F3SHLsc6Q
	pt+aTSxrDYiVcXV3AyRMwN9EDVRID12bCcvXcEaQ+TgV9GzrXfNi/PrUiq2gTh6B
	xu2O7qegtF8oyUBb2e+qAwvx11PvSMUuGIqqsxahZoAXssmg4pbOo4pJ/QW/XXF5
	qHBTYoCgwrJ1/5bAFyD43wqMgelFjrj8FNROs+lxsnWDdOfMwtN05VzZjqjLlkGe
	KSxXzvfp6GOJ6RZbwutHio2Y/0Kox5YZZ4oOPJfE4DxX0r9LVQnDJlB8Zlg0f0Nb
	6dY1iGyyZ79tHNfDXrUVc9byIwvUPSbYahw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795624820; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:GyCVu9DQ/5NIGh+yfZ+m91aabDQ8lz/0HFkPi56/7bbKCPb
	QnsKyiOl7hjbXA/yD1dveNORVzyNl78RGyqjyNj1HQs4W8Tn51tzkBy57oiD4k7j
	RBalZcliYpRbqqkA7aSBoQicajgJkXshidTc/uS6D+gbQfQePX+ZrkDsCaiXvQT8
	VlJ29d8WChHO5RRtOQ9zq2a64gz+6WTKirhOnOXb28QLd6HmdgmuMsJdunEyyQ64
	5RjLNTY7Siq1FVgHOHr9ft6hweryY7unmbRJbrnZtHXkmva94C7v1rWFd48zKqiE
	dry78vx8oWLL7CNe39+gWTAAykLF5gNeX9YeSyg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VzbQwFow4I5mRyZL14MErE8FiLGvx6AWvz4eEeOhShY=:YHstVPHYNyvX4vpDklnY2CZmSxeOHydrehDj1hnjaY0=;
X-ME-Sender: <xms:dA8Ha6tSp93tD8jvM5G0qJTMnepTAo6f1pAjC7Yp1JSi512NImkJ_g>
    <xme:dA8Ha98SrhOq8nep0rEnZMXo53cHYdk5A8Y--PwT07Vcq-Fsu_7uCCh94X7OZW41l
    63D1H9MT7cHhu_TEJgTjYBpA0hKpOALC7eP8ZFySlBcZ_IfFZUE7Clh>
X-ME-Received: <xmr:dA8Ha8l-ogOVA0EZTJQ4E8rw3SNPJEh8bwv7KgSkNCHYhN7SKrYyK9-m334>
X-ME-Proxy-Cause: dmFkZTEkqydggF2VGN09a7SrKmgF7tz60VqDezGtPw/dRKooC7tyMsvMNLlCXGAviBqhDU
    93cLkBtcTF/ucCBSar36wkl3kd33JvHYspVdYeyipUmqt/l60Mse+Gn+BTfLSEw9fQzJCl
    yc7P8ea1mUpj5FldO3/aAmMN86Pwjz0uDh17n6Ww+tHCXnDH8anNJewq9AHIh8nXBSQH9Z
    NiV5XIMnehotIcMXVnD9pelppKHC5sYdrWwLE+Ye5A3bbtPEmFnwyOEZWbArkJNG04fNaB
    Db9QfGSYpAbQHWjYavuTzy0ax5RCEaY5cx8EBsnpJaoiUhT9FfKmmDN1TKMN8fKzwr2CLz
    vhm6Ft83kwzkesm1UcSf06EM+1IQaqji53VKv96ManUWeW99JSgoZG06nLHJs4zbru7r42
    cJnAMx9i12DJKeVeEhIZRtnRp1/ASlDe6thOSFfV0mNlTC9sGqOjoc1qE4LFV06Zg6Sd0W
    dXCaUVEsbiLRi8rvAwT9kThBXqIQa2AXWJ079Tk8y6n5EYoH15BZfLde0ga+L+0MXS/Z5T
    r0YRiMhFD+piPTcm2oP9XLqwsH2+ccusawVN2GJRnIP4AlgMUPt4u6Td6tJXfsaD64tBAq
    WpSoO9KOQZXDahQexVB7pwmv3/3A8uZDFTIebqWNt2br4QIAZcWX3KLHeOPg
X-ME-Proxy: <xmx:dA8Ha1PdyooxCku436jFU77-C4URK2gN2pMC6p4x8wYfUdobLXPWUA>
    <xmx:dA8HazIMvC3g0mfBxNeiKTuPQC6it0t6GaMQVIDaQGRtSqtO2YlV4Q>
    <xmx:dA8Ha4GbVkIe3gILDtnjNUZm_KCAwUYw0tK0luxoj_1Bq96MGfWqWw>
    <xmx:dA8Ha8AhLyZTomI_2pyw10xnx1OaeryX9UlK4oGIacs2CMc99ivcVw>
    <xmx:dA8Ha7fZaUimu3PLLh1tMaFCuDqVE2-pgwYmBKtbXcxgVcIOkX9AGJum>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 11:40:20 -0500 (EST)
Date: Wed, 25 Nov 2026 17:40:18 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Felipe Pereira Stival <v0idpwn@gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tls: add a poll test for a queued
 KeyUpdate
Message-ID: <awcPcsS705o0Qacv@krikkit>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>

2026-11-18, 17:35:49 -0300, Felipe Pereira Stival via B4 Relay wrote:
> From: Felipe Pereira Stival <v0idpwn@gmail.com>
> 
> Check that poll() reports a read event when a recv() for data has
> decrypted and queued a KeyUpdate. Once the KeyUpdate has been read,
> check that poll() doesn't report a record sent with the new key.
> 
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
> ---
>  tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
