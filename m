Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6474B53F2;
	Mon,  7 Sep 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785198; cv=none; b=gzNzaB8R+8xcFuDU0G6zfzX7HXdta4eHzZocivp5Ju1ZSCoZJuYGZ12vSfLfu6uLjUEpFc3BvNIEa4MiuoRJSMeqzaJipGkP/yt308S1azoH+NohH9xADEMDPmccDIwWvgoP9SuPlHR7ZMvroHZ/Z6HyZYTcKAXtOG/tDuHoCxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785198; c=relaxed/simple;
	bh=L7senZac0sy8pUJGmblXJVzYmWB+RzzCcgxvI/i3zzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jox/QIhWQ7BvgwMchqgxiDQpXJVZIlYLfofaPNItKL2Polgzm1FwAkl5J/LuV1kYeKeRwbeog/27SomTdXCNxdvVFzkvFaq9rm0++dX3EbaxYzyhfzHdtXTRfJuWiYpHmiJ3BefXqu4RgaZA+UiwjzoIwxGrXIpk45mFZ9XZrtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BCeQmDL/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BCeQmDL/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jWlh4ZuZ5M27NzituDSZkqPWQo4oelgw1EQ9Hc1dxp4=; b=BCeQmDL/CZHVxh3I2HbjFjyBnz
	c1kEVeahbGx1yF57IMB2uhyNerwHA53diZruJ/OF4RA3rDzK2N7zJchupwSp6Y+L6d0W6qn9Cp293
	Dv8IscKgr1IOMIcZXizISYKaL2+RFKzfM3Aq6CLMDe5A7kufbk+nP0FMSPZMVUtn/7sI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3Yjq-003W8S-R5; Mon, 07 Sep 2026 14:46:18 +0200
Date: Mon, 7 Sep 2026 14:46:18 +0200
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
Subject: Re: [PATCH v2 3/6] net: llc: fix repeated word 'all' in comment
Message-ID: <73289f58-4937-42da-9016-796a13ced97e@lunn.ch>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-4-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907044635.7141-4-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 10:16:32AM +0530, Hemanth Selam wrote:
> Drop the second 'all', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
