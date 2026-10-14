Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB436F429;
	Wed, 14 Oct 2026 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001636; cv=none; b=elJZdOAX12LBCNdbgJb/nNSoEfw53wGlRW2iWIQtmiu7vOoZOyhZMMgfyGjNMWREDuiNlIqeFzd80dHmGvOJdMiAyeKq64KraIHUlQBY5FySyXQjU7Sf6Mh1JrZIPYWRkWddP1LaS47GgPNDBuZEfVFnZXsm4KoGOdD3SoZNPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001636; c=relaxed/simple;
	bh=nJy4YvrnirCpWvlyFFVgwEtdCw+JqnZ2DQsskLx/t04=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NFiNl19QlYLTJPMY5zoG3SKKMwnnYK5vASRDrLqe7mav1b4Uv4hXF3EtER+ucu7ubx9DOXgq0zWZ7NOutsKv5WlWfDXM8TRnwnUchwqRmFfQLkS9hPbtatgK3R6aH8MRhBx6aqjyP94euYGeXsN9iZ8rbDXHi6lndJG2FaUy9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aERoyG5s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aERoyG5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5EC1F000C6;
	Wed, 14 Oct 2026 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001635;
	bh=SsfQF6NGGsR26kPmeOdrXvyyMauyf47YpVgOEKJCPZQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=aERoyG5sXWz/v00qKoGJv+3Vib33kY19ZrfxGdQq4otEUGYcAGx312w7fCR0NqkNo
	 0BiVOhZM7A8homSL3Pu6ep3QG5mOMtYirWcRqTmE8GruOdE8KG9Gmwpy4uGn/LEua9
	 akOrOGHyIMcUxxKuHz08XlEVOTQ2z0jLbL9+o9Xww0UDzT9fjmETyo5VKrOXY5dZw1
	 eD4qBT5BwGI6SnvRGwryVMBiyOoXWd+GGFXUYK6iyrW70c6V0SDzqlqI54D4/4MUI7
	 RRVk9jKR8CuLrpVRMJDEPNnzKV1ONyUvmUVqfOlFS7dyDQ8zqUm1z+haGCvXFY2/LJ
	 DG8r+R8JBm5+w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD050F40066;
	Wed, 14 Oct 2026 14:13:53 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 14 Oct 2026 14:13:53 -0400
X-ME-Sender: <xms:YcbPaoXq3Uhd4C5jTGedF16bSaP1_WiGvTT6kRsPl9mGS7--eoTaZQ>
    <xme:YcbPanYsW8uomwvqOFX9PiS1l_pbns7-LsZXcRygYJ99h293zfGEiNEbqvzv_jmY9
    Cm7vnORr7gg2Zfni8v4Juop1h-V_w--IsUG91E2QP4EItWboSq4tMY>
X-ME-Proxy-Cause: dmFkZTEaowa4Hi+MrPKvIxbBTEOB5+cw4cKhyw6bWxzW327ShOPTIStzm2TikFVDhawEU1
    qJ4LVXPEVG1e/iLBckePzgvlqTRqCd/3gjNJIYglB3njPRDzQb+r6B/O7+iPwWNpYQuHaV
    XJb9q4iEZ8nCYBKPlzGvZ+aHF1ExPs51D+6Qp7M8XqePkiNMOOY5hjLocwACNHPzeCUsba
    m6f9jB9bX6b1XJbrBk59GYAepiDs+iEibd+j24jv5wp81QK48b4tZphg2jrG6ngqA8JJgp
    E7+Zu8xolyt0JxwnevfoZKmQAKPqHw/Xk7KB+YaB8L112L5J/MQP0oMFHMZQkmS58AjDXx
    SRJIRZeLjiCOVzTmQRyshc5y6o7WL98075uy+1jMzM3TyZBNyOBeeauyZy0ypXQGUO7nqM
    iyiUfFs23eYNkd6z6tK1ocdgrnerR5qorPJU6uUY6uSb1fxYGWaHfqDnNH+gc5eDBR5oac
    DMDoV7h8cDdxOv2NcEJajBadYOjYn+tg91O1+HyESX/aHPnvdUyq21wdCVOEjrK2NYjjce
    Km+Xm4CI1JRImYIZQ7GixgVgRdXPVTUz/mAE1aKAe/C/9k7ZvmKjlCQeDetAtisDz1tguz
    u6RilrbG8/T3iNMbSOI5Jhz+nxPAcyHdDddDuPAlIPi/MqTQBPfamzzGKlOw
X-ME-Proxy: <xmx:YcbPaiKkW4FYxPuIP98Z_jl5_6MRKj9xuA5Mlcsja3APGFIY72qadg>
    <xmx:YcbPam26fUKEK2-u34DI9AdqaT9AwIwDOVyxULNLp7Iann-7PegvEg>
    <xmx:YcbPamkxcCHs9Q-nnitGNwu3U_Iolk8fSZy-61zF1rtog5m7-mPNnw>
    <xmx:YcbPahhTu0E5a3lkTRPVkfkYZuE48XxGEvt6GNl2oTqMSSsup1drGA>
    <xmx:YcbPatQ-AXtwkYtQ_Nd-PZ07YS_DAwMEGxW4CZ7S4VODz0CBNlvBKv5s>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C3EF4782738; Wed, 14 Oct 2026 14:13:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ACqU82IlF9Nw
Date: Wed, 14 Oct 2026 14:13:33 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <8e4d3f71-fdfa-4065-9dc1-388676126ea1@slotpi15m67>
In-Reply-To: <179190790187.434549.10720335019823028544@kernel.org>
References: <20261012-tls-follow-on-v4-6-8cea429565da@kernel.org>
 <179190790187.434549.10720335019823028544@kernel.org>
Subject: Re: [PATCH net-next v4 6/9] tls: Return copied data ahead of a run of empty
 records
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 13, 2026, netdev-bot+sashiko@kernel.org wrote:
>
> [Severity: Medium]
>
> Can a non-blocking reader still be held here when it has copied some data
> but is still below target?

Only while a record is already parsed. A nonblocking reader below
the low-water mark is still collecting, so the loop keeps reading,
as tcp_recvmsg() does. As soon as no record is ready,
tls_rx_rec_wait() returns -EAGAIN and recv_end returns the bytes
copied so far.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
