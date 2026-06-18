Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F4348886;
	Thu, 18 Jun 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.128.211.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806481; cv=none; b=GNDO/vloRILtUweuOPHDRoCXo2adoH3F0YZ8yjfAwEheERCPggi9E6NeEQR7Rmba/6N43hIHDv0SzhymU0ftCvxDbBn/Vctvh3Levyr5jJLjaSNrGQ5+h+323UgBJqRsqY4jzag6fgnACMG6ApeDlzdxKcR4Wye0dP1aZOif07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806481; c=relaxed/simple;
	bh=WOWmaqp8aGhysVoZr+yEoHr5kwf+QFGaMU1rB6CZO3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXpN5FgoCugNF9rCtiQ+B/T59agFsjnarurpMTakCbR/wLMyMkVIDZncH8m9cIdP3ffs/2jj3bqu6OCaGqKijKrVovYknS3rYKbaT8RcQ/UsfSL+wBR2CrW7lfK08PA0QSrgo+kWFJM/b+DnCKbPXjn0ilkXB0rV5+U46HK1VlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net; spf=pass smtp.mailfrom=librecast.net; arc=none smtp.client-ip=185.128.211.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=librecast.net
Date: Thu, 18 Jun 2026 20:14:32 +0200
From: Brett Sheffield <bacs@librecast.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net,
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
Message-ID: <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
 <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>

On 2026-06-18 11:02, Shuah Khan wrote:
> My apologies  for not taking your patch earlier. Considering the effort
> you put in with a re-sending the patch and following up here, it is
> only fair for me to take yours instead. Hope it will apply cleanly on
> top of kselftest-next
> 
> Rafael, I am going to take Brett;s patch instead of yours.
> 
> Apologies to both of you for the mix up.

Thanks Shuah & no worries.


-- 
Brett Sheffield (he/him)
