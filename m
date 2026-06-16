Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C81D7995;
	Tue, 16 Jun 2026 02:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575218; cv=none; b=uAxa/yn3xrdUyiHymF4Rz6NEXgPdf1p65Ry89oCFHMRJchgjs6FlH6ReHiOYBdneCWLbinZ3cEYTF2X1lfT26Q9ZLwWZfiyc4IT+smVE7x2SEgozo0UgIMFGD1mIinCfHNZla/07Q0197M5taHL4PO7yfP5Ze5PW9oVPia4ju/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575218; c=relaxed/simple;
	bh=w3tqoDMkP2AtOb/5kwyASTuSFPFJkEFni9980rTHqSY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvIzvBCHLtaitjOfxqBUDNaManqbnzbGsImYUgrDUTPHntOHIbdUoNuRZ8XlsCunCv5V1+vwp2cnPg2OxQ0kV9V62XNjiq/k5zre2qOPeicxMVbGZBedwfKJKPdRHUdVJKQ5b0EF5EpyVJ5xZeVaN/8YQOiTMlxz5okghgQdZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvlmTDzj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvlmTDzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D461F00A3D;
	Tue, 16 Jun 2026 02:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575217;
	bh=FOHMFh425tyGpF2+7YN6uA0GU59wRyJzTc7Nyej3d2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EvlmTDzj7oimd8mAGCGNIVcAEAPfwYJMGyosfY6xRe3ypxR+ZYsoqhtUT2jyMQrZA
	 0f+cPgbfwa+WwzKZZeMHpQaQ154ThXLQRbzGVgjm58+g1GkyYK/V57X5mxDkMelSjB
	 saCxWmiegMXFu3PmRstOct8JLNULnW9TExy49e2Jo1UPTMiRtKAU20lwxwfIUBEOIQ
	 J0bktd1J0AiPAIjao/7k2J8/6TsCaCswbhbo6zHpdNTntYnfE7N8yjpP2/gsfiJTsj
	 EDJpR7D97LS94YHJRmuekVlvqVbM0hY5fJqMvF3uCGe6c4AaUCJPIbpK83yVNkJGok
	 OG7ITfb6jklEg==
Date: Mon, 15 Jun 2026 19:00:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v2 0/2] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20260615190016.060a4ab4@kernel.org>
In-Reply-To: <20260614125000.6058-1-hemendranaik@gmail.com>
References: <20260614125000.6058-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Jun 2026 18:19:58 +0530 Hemendra M. Naik wrote:
>  FQ-PIE runs an independent PIE controller per flow but exposes no
>  per-flow statistics. This series wires up fq_pie_class_ops to expose
>  per-flow AQM state (prob, delay, deficit, avg_dq_rate) 
>  via 'tc -s class show', following a similar pattern as FQ-CoDel.

net-next is closed for the duration of the merge window.
Please see: https://netdev.bots.linux.dev/net-next.html
And of course:
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
