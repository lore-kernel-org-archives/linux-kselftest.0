Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028CC384CD6;
	Fri, 18 Sep 2026 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772349; cv=none; b=fu87ahUgCrqFZE87HpRfFG8qoJnrurDzRgLH9AsMvOq5ohAtCiR0xxkl7B3zGi8cOTQGSQcQS7+vuAVRwu54tLuMgZOYI4K6qGiFbZxm9RGkrOqkggjUV6IrmHzhPNBOECz8e7NbyR/1SGO3ZPIG/RvULMudgmiuhkzHJksC020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772349; c=relaxed/simple;
	bh=xBGKHDXPYihZ4GLk48VakX/kzZufL5ySVCmdvEtRPGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6RmX2WlC0bkxwOjbsf9ANsWXdxn/nV5TZ9E5/XJv2O55lavSqDSJgdB9JpWVoIxjgaMb7XQJzS2wPhGIZEh9189wFlm0HhQStZdozsUGEgRYulBhKfbgnBmd3x4NX4qTCsScB+LgqFJnicWz8EHALG4po8o3udcAg+kGH82OqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaCvuE+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaCvuE+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9B61F000FF;
	Fri, 18 Sep 2026 22:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772347;
	bh=9O9nwFFcNTmEpdAdVQ9YRRXNtMctqMg8jGkJKm2S3xY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aaCvuE+gUlXN6jZTKjfScJjLAnK0pvcetjstsdqwxuh6z0lR7AfzeOF+pJA68q6Kq
	 bkTB0AauZCKN/mYUKzgOxfBPgQR3v4tN8GLUEEX8GLTTKYPjCx0iOhyk3bP2iDowLH
	 rD14dV3z6DOpmIy1WIs6Tx7Zv8JULMCgYnwC85OC4PIn3p9GrM1swG4MbaGZqix5kC
	 oQa2m+ZzzVQ8MoTt8SubsRGiajBADFXNJdRQde5yITNbGCb/qkMIDl3jLAoxS0flO+
	 odE/Uex2il6yveKadUdsB3tUes69WPweN3v6FDctOOd6CovEqP+/x17wATxCSJIVTn
	 MHT/2J/oOogFQ==
Date: Fri, 18 Sep 2026 15:59:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20260918155906.13d01c2a@kernel.org>
In-Reply-To: <20260917204225.275251-1-hemendranaik@gmail.com>
References: <20260917204225.275251-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 02:12:22 +0530 Hemendra M. Naik wrote:
> This patch series is accompanied by a companion iproute2 patch series that
> can be found at:
> https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/

Does not apply any more. Also can you put it on a branch on github to
make it easier to pull please ? 

Please rebase and repost both the kernel and the iproute2. 
