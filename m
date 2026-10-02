Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B940A945;
	Fri,  2 Oct 2026 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939197; cv=none; b=p/es0+Jn2SLRMoibe2PHmpKagUyCbVH0nqJLE3rtczc/SPEySCh7gMwaQ4zifQhp7dTRgI/MXMuUpUiwB0TfTI89DwqLcjgVLmpSI4Aydvrj9198aXl6zyNUtEB0zvqogVSbV++gcVSnLb8B1HINgvQfP7EPxzH8IKiQ+J16eYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939197; c=relaxed/simple;
	bh=L6j2O31H9syuWtOYNd5qQMUEObSOi+tTZGC5Jny5IF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRzbGQxoYvTIuT8hIcCEYdAoxJULevPzxmj2g9ApBvGndcLLM4hmaE7XuQ+PFmtANDYwmSgPIl2HPWSDBlJnG6zjYrlkBjJXrgE5BCBhwDukT/SvDRO+RaJL7Ym3nJdUgvx51Z2TFbk91MaDVUHyx6JMzXxzl/4EeKzT/HcykFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UovqIE6w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UovqIE6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA25C1F000FF;
	Fri,  2 Oct 2026 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790939196;
	bh=sZcJfC4lSYb9jhPBdrXhStUCbvDBMMhqCyvkDXHCnf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UovqIE6w080MweC07o54v6HAQKrDgjwqu5T1vAdVfkZ35u4WUWDJoSJxhP2XMFINM
	 V6u471/iWqTrcCa+2bjU+uXTHLCdLD7VXTErEapy3IqZmbajitnhEv2gbvYyuJc3E6
	 4a9zcbSoHzLPY2ZI0Ryy8UxC0QoQSwAFjobREewo=
Date: Fri, 2 Oct 2026 13:06:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: tjdqudcks0424@naver.com
Cc: bsingharora@gmail.com, akpm@linux-foundation.org, xu.xin@linux.dev,
	shuah@kernel.org, cyyzero16@gmail.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/2] taskstats: fix cross-netns exit listener delivery
Message-ID: <2026100208-gray-yiddish-d249@gregkh>
References: <20261002105614.195370-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002105614.195370-1-tjdqudcks0424@naver.com>

On Fri, Oct 02, 2026 at 07:56:12PM +0900, tjdqudcks0424@naver.com wrote:
> From: 성병찬 <tjdqudcks0424@naver.com>
> 
> CPU-mask taskstats listeners are currently identified only by a numeric
> Generic Netlink port ID and exit records are sent through init_net. Since
> port IDs are namespace-local, an unprivileged init_net socket can bind the
> same number as a listener in another network namespace and receive that
> listener's cross-UID exit record.
> 
> Patch 1 associates listener entries with the registering Generic Netlink
> socket's namespace and port ID and cleans them up when that socket closes.
> Patch 2 adds an acct kselftest which constructs the collision and checks the
> normal listener, explicit deregistration, and unrelated-port controls.
> 
> The test was built with GCC using -Wall -Wextra and run in disposable QEMU
> guests with the same userspace binary. On the unmodified baseline it reports
> 3 passes and 1 failure: the child-netns listener misses the victim record and
> the colliding unprivileged init_net socket receives it. On the fixed kernel,
> three independent clean boots each report 4 passes and no failures. No
> KASAN, UBSAN, BUG, WARNING, Oops, panic, lockdep, refcount, use-after-free,
> out-of-bounds, or kmemleak diagnostic was emitted during the final runs.
> 
> The exact Message-ID and lore URL of the previous public posting were not
> present in the available local sent-mail or raw-mail artifacts:
> 
> Link: https://lore.kernel.org/r/20261002075842.146026-1-tjdqudcks0424@naver.com/

Please slow down, there's no rush here and you aren't giving people a
chance to test or review any of this.

thanks,

greg k-h
