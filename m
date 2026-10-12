Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F66214813
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 00:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791765150; cv=none; b=eBtmKekudguX1h8I6VYsUswtGK3BcbC/FfSw3PklxVbrv7x7dGb3ZFPmdixkeFz9t83cS3XDMERsfbYFriDMUQTca145SzXhrUk0Lmmidpkb02yu8swlAnAJSBNGroPD90ab4jAuKbAG9KhcKxBXkYuArUYjHBQK0Epi1s5KiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791765150; c=relaxed/simple;
	bh=ZYleLiMnCKQ5GR57alNWmxsZ5L0Mu0IfJp1Z8IGCjP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/InQSh2lt3RC0+o/YgDZ35B+/SYHXJh9F266He/lpOvFVg9A5It5ZoVTSj81vKRBDipo4aVJHkSYbs1FEFoz2Sgl9kX52UY9b/iAqdyid1Wtw+5sdDXkvbqfzX9bt1VZatQadYZZqXRyH/CE4iek+hD27DLomnOa0pyHIKLeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hLuXZeuC; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hLuXZeuC"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZYleLiMnCKQ5GR57alNWmxsZ5L0Mu0IfJp1Z8IGCjP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791765146; v=1; x=1792369946;
 b=hLuXZeuCS7xOG6V2OdMWOiLi5LTm7HxaDWVJbJfWbZxaXY3YBiq/s5aCAywU0d5GaUWIHo/H
 xGbQfOrdj8bEnRiADwbr5/aAfH2C+478aF7K6V5Rma5C3/cRhkTyTzYjA5fPlsKQ4xcavcfjPzt
 EAzV02JApgZ6AkwUvDC+iD7g=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id cd0d990a187f0bd6;
	Mon, 12 Oct 2026 00:32:26 +0000
X-Mizu-Trace-ID: cd0d990a187f0bd6
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 08:32:19 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	edumazet@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for
 End.X
Message-ID: <aswqk7xW9RWdBROt@fedora>
References: <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
 <179162766256.434549.13511080924871737471@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179162766256.434549.13511080924871737471@kernel.org>

On Sat, Oct 10, 2026 at 10:21:02AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] End.X now accepts the flavor pair NEXT-C-SID + PSP but only
>   applies NEXT-C-SID.

Andrea has post a patch set to fix this.

Thanks
Hangbin
