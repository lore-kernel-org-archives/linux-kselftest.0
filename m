Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F30C4446E6;
	Thu, 10 Sep 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036471; cv=none; b=lEB1jTZeEH0IBFx97UZADnK8+1rknbTMmTuqyZ/DPyB3F1GejWOxwsomW3MLomxzx0L+kV0EgVBDg0/lcH2DiC42+YHMMe4lOvSnQkC/UPWwcJVfGvAP/eepxI1/EuwunC5SbvcNe1CF7IHyFxS3vpd97VECATgZozwiwF71jJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036471; c=relaxed/simple;
	bh=q1YDDrTxGjVzHDRvMhINydxjp+1w/1+D4ekYqJHgRmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrANLYtpj4mDbnVil3vYrHhZ5AUMxpBfW1pVQmS2PasbBVMIr1pqIdSmC7bo+RgiBBO/B31rBXm8TnwhGiCVgBVJzUe/sQcyNSwcz0lKD0xdFqoiblQGRO/u4cWJ02PVvqnjHpXwkFQS2agdZLxhEJLvxKAortPsk+O3BhAePqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhLSgVGO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhLSgVGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F101F000FF;
	Thu, 10 Sep 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036469;
	bh=KVa5/Y7xn1EpqKezVaRBDPkPb7Gx5+V/7vYVwDKr84o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FhLSgVGO0X6wgMpX7DG6T3izBHMHrV9JP+kxARDtJ0xIJQBRE2Z4Yq+FhasjrClMm
	 fmGa28mi8hRe8u0uCZicXaSwRQ/wJiYVu2yBEgo5IeNtRcuzuvHp5tgrKzA82fznMm
	 64sDXHsv5KXqc8Z4Cu6YvReBDThrPacpIlfgHpt5FoJsNAgjNvaS+M8jaLUVwK8AQ2
	 OfunWtDDRhDwT7MHakVMphGM8Uw7kQAHmgbgB9+Eg/0fLGQ62gX1rDnuxiI0iMBmaY
	 PNSl1tUwWGVqz2CZLGW6dI811EAOe2q/QBvz/DG/v/w1l1MeJ0gT/WIhLhQ5NXljTt
	 J/ecnYDN1gvlQ==
Date: Thu, 10 Sep 2026 11:34:22 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 08/10] net: hisilicon: fix typos in comments
Message-ID: <20260910103422.GZ40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-9-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-9-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:56:00AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Jijie Shao <shaojijie@huawei.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

