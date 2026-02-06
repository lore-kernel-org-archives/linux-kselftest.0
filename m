Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434428469A;
	Fri,  6 Feb 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390502; cv=none; b=o/7hEroqjAINEiaPpZhEJEpeIc9RylCjY/6BG1k28Y+gp+yRVSu3ycDSRnitSXJW0CNyYcbRaVsfFdwdI3x+jHA/PLfhK9QxQpAJu1ESGro0uCbBtmEdl4LZjUM3zz5GywlelAwA+nJ9kBTuYRsPCPjj66G+7IHEvGjeKEFsfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390502; c=relaxed/simple;
	bh=9tiDDWq2ShOXR5rjjibeBO+nR0D/mMljMRDcwAM+nLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVUUWWyBAJI8eurFrx2pM2LChGyt3Lvb0T+tESrXTF0A9x//JsCDLolK9TqSewkBji9SjOfQ+69moIDxlG6D8cuIM05UzBSneCNY9eIbozVXTkJ/yOzTk0yDS4FbR79jfJ0U4uzD9DoTXuYIXHH7mo8C+U3V/PoSOsJgRtAiow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YcdQv97L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YcdQv97L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7803C19422;
	Fri,  6 Feb 2026 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770390502;
	bh=9tiDDWq2ShOXR5rjjibeBO+nR0D/mMljMRDcwAM+nLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcdQv97LQfP2VP088pqNme8erk4ZEDgtjx4kNy9EEc1WjRlm5Y8JARuW3XRxNMi2O
	 hos3JniBqmwwSfx9NFyWNe6cgoa5DqW/47oLeVECqapyBdFa2TFq/JGsNMRABm8aqz
	 jmhKHBDRPpTKmCmioymBETiqfKbuI1DCbzeKKIDk=
Date: Fri, 6 Feb 2026 16:08:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] revocable: hide the implementation details from users
Message-ID: <2026020654-sadly-anchor-00bc@gregkh>
References: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>

On Fri, Feb 06, 2026 at 11:32:06AM +0100, Bartosz Golaszewski wrote:
> -struct revocable_provider __rcu *revocable_provider_alloc(void *res)
> +revocable_provider_t revocable_provider_alloc(void *res)

While I understand why you did this, and it does save us the "__rcu"
usage which is essencial, it still makes me feel dirty seeing it :)

Also, as the __rcu pointer is now "hidden", what is that going to mean
for sparse usage?  Will this accidentally trigger problems if we do
anything with the pointer incorrectly?

thanks,

greg k-h
