Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA54CA28C;
	Mon,  7 Sep 2026 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785245; cv=none; b=TnmIqvYRNzpquyoZ4AUdeKwtibK88dl6fTn+NB/H52WMtrtNT+8+NJ4OxJIbUMIJqCv8qwnQPR79Qe0GaYSAnVnhS7v71oI6BwxfHbg1jDZkMcEo9GiQXRXRMhankhJj41r/zTCfLEPM9/rl0+1QvS4xR3S20z3BTSxItPXti5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785245; c=relaxed/simple;
	bh=3jzHfF8u66U4CkdfROE7pgSpM1GNQ3StL7xFXm46nTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRWhUTnIB9xmxINpnRa3cip910Mqp9M830w8QYrbzpP6zoHPCCzkrCktq74EAM5VEXmvfgjy+/9bKpNi9sJWuGmYEoz6HFobfC/9MPIiNni15V410u5IfbvTTrh6rQqsPHz94vXqfEYiv8QMK/PWg2NkLsyXy9WzN6YYjRFD02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nQ1X6SOB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nQ1X6SOB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JLou8S9ILPVlsF0M7Wpo9XaUFU4gg0/ZQVsWHAAraeM=; b=nQ1X6SOBbKC+amzXfgUzXeRAx+
	Deg2awIFuLzH2VU/oetFXMmlKcV/NS9oW/Njh/sZyIEMn886D59YU3izKIvmcVfAkXSlXxPkH5NUI
	blNiiEjLUHkfA3JENpXieyvyOXpa+FrISBxb8wQ1dIzwHx0yeRe9SOYk53WUPG9Rnz+U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3Ykk-003WA9-Qz; Mon, 07 Sep 2026 14:47:14 +0200
Date: Mon, 7 Sep 2026 14:47:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/6] selftests: net: fix repeated word 'use' in comment
Message-ID: <713f3339-31b3-48f7-a162-6ace106c1543@lunn.ch>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-6-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907044635.7141-6-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 10:16:34AM +0530, Hemanth Selam wrote:
> Drop the second 'use', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
