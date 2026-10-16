Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAA331DDBB
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117037; cv=none; b=D+T+T7OyzxegE9RRPScHKHRTG2O9KSIiGKpB5wNq4Jw0PbvT2wQ1OMd/CMeky696YZ4T9TVtgyG+luczzlPs5xgzVorALhpzP/k1UQgR+sVRKiJNbsVJqHFXF2n5mPOHiAgbrg5goGlfp0GdOirVuFKLsDnwkTvaUX5mwWJxSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117037; c=relaxed/simple;
	bh=ZfcXLYbEROYmyRqjxI5fimsigiDO9HVNJZE8yeuoZdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c23Zukxxw0zFtGMpZxGvyFOfbqwj88nOxpbEa4ySuSdesWqhg471hKM8/Eyv1k63GhZL1kZhyKhzjx6CBKu30eDIeHciTZExmGRycn8RqyAeuPaF8UZcuR9cgsZ3ut/uusZ+4bbJ58DMUeu7FzfBSQewx0dHxZvi23wLuRcPrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fYOM8xGm; arc=none smtp.client-ip=91.218.175.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fYOM8xGm"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZfcXLYbEROYmyRqjxI5fimsigiDO9HVNJZE8yeuoZdI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792117033; v=1; x=1792721833;
 b=fYOM8xGm4f9BfLoGn4XcZyDZzt+MKtgdnjD/GVy8mHiMK3/rzvLkdpeXRbXzif0kqRh76nVD
 oNie7tmiuyFs7kdf2oRLKOAJe+LYlTXd2BTwVDKvVj64YQivbjVEE/RbiSWgUSg85wd5zEAaY4s
 +QNQ5E9Ri9JvHAXh1A4bPaYI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d0888d6955ce37ff;
	Fri, 16 Oct 2026 02:17:12 +0000
X-Mizu-Trace-ID: d0888d6955ce37ff
X-Migadu-Flow: FLOW_OUT
Date: Fri, 16 Oct 2026 10:17:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	edumazet@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for
 End.X
Message-ID: <atGJIp4nmheErhrh@fedora>
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

Andrea has posted the NEXT-C-SID + PSP fixes to net-next. I will rebase the
patch set based on his works. So there will be a new version after his patch
applied.

---
pw-bot: cr
