Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABB4B53F2;
	Mon,  7 Sep 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785385; cv=none; b=UVWGMibymTsolxZZyDXCx/FRYtPhZvgjWcZ0y5tLwora0GIvxeDFCKu1+eV/otjgG88A601cXKqJyplUNLXhiExvkUHbWGAo/BLAXjhDnCkkOPOu4a4Jl0CbNzlFOnEtm0Mgwo5ZPlDpps1fSC4yoPQPAhhYA0jKjo/01vRXPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785385; c=relaxed/simple;
	bh=pwb7NTJGj3dlb9lXsqdY94u6eC56gfuneLxz6smMads=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXt/zGzDpP3LKiCY0PUKYTJ9XoLQTmxbopkytrnPm9LBf0igAIbaWzUaSOYtdeknP+nUs7jo6tkU/9SljDepamp+2f62iDNmIuL3NfrRUWAed8D3gy8jvi0VzqJC65Sulg+fpt+3ohUJBA+TkXtmcBPRMItNWL3LBc6TdjDSjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zBC0Yka1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zBC0Yka1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KmnXnOD4h3D4EwV6TTh5rv0v1H9sLDbOiWZ9H20rUAc=; b=zBC0Yka16p+u/xFWmZc3GPwoyZ
	/in2HvqOk/a3FoGm2ih5DCGf9XXc0jn2T1zSTuYseEzPa5vLm0SHYi2Kr35fyORkiL0652+UBNIDZ
	mXk41OGmQ2Ik5HfBNEddnkcJfgd082Gie1ktb8uG3AVJKZbgZgLLhAXQ65cVlnWKABHw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3Ymz-003WCt-01; Mon, 07 Sep 2026 14:49:33 +0200
Date: Mon, 7 Sep 2026 14:49:32 +0200
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
Subject: Re: [PATCH v2 6/6] net: usb: fix repeated words in log messages
Message-ID: <7c8cb3f3-8eab-494b-9f97-b30693a361eb@lunn.ch>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-7-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907044635.7141-7-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 10:16:35AM +0530, Hemanth Selam wrote:
> Drop the words written twice, reported by checkpatch.pl as a possible
> repeated word.
> 
> Only the message text changes, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/net/usb/asix_common.c | 2 +-
>  drivers/net/usb/sr9800.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> index 4f03f4e57655..e63a849a1043 100644
> --- a/drivers/net/usb/asix_common.c
> +++ b/drivers/net/usb/asix_common.c
> @@ -413,7 +413,7 @@ int asix_write_medium_mode(struct usbnet *dev, u16 mode, int in_pm)
>  	ret = asix_write_cmd(dev, AX_CMD_WRITE_MEDIUM_MODE,
>  			     mode, 0, 0, NULL, in_pm);
>  	if (ret < 0)
> -		netdev_err(dev->net, "Failed to write Medium Mode mode to 0x%04x: %02x\n",
> +		netdev_err(dev->net, "Failed to write Medium Mode to 0x%04x: %02x\n",
>  			   mode, ret);
>  
>  	return ret;
> diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
> index 6fd33a5b2279..cce0392d0232 100644
> --- a/drivers/net/usb/sr9800.c
> +++ b/drivers/net/usb/sr9800.c
> @@ -271,7 +271,7 @@ static int sr_write_medium_mode(struct usbnet *dev, u16 mode)
>  	ret = sr_write_cmd(dev, SR_CMD_WRITE_MEDIUM_MODE, mode, 0, 0, NULL);
>  	if (ret < 0)
>  		netdev_err(dev->net,
> -			   "Failed to write Medium Mode mode to 0x%04x:%02x\n",
> +			   "Failed to write Medium Mode to 0x%04x:%02x\n",

The same thing twice. Same capitalisation. Is one could actually be
correct. Please see if you can find the data sheet for this device and
see if it gives any clues.

	Andrew
