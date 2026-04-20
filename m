Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA43D0922;
	Mon, 20 Apr 2026 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722549; cv=none; b=oLkbxgAXYq6XcccDK0BKk2Kd9tWKzvVz2b9u4C6MqOn5hyxIgdh0+QKl+sDfIB99Tk0euTq6w5DchmVoqbrOmUVfANujAC5xsMczKLIKDH8r8L1bzpreFA1gJNeOkQmNd4xATgHMMAtWcig6+lR9emDrh+1zG0AAqFtD9l+Sde4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722549; c=relaxed/simple;
	bh=b/0ABm3fRJfcA0PmJ4fkRGtiHoTpoZM/NNnUWXYxqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxnux2mhNINY2gSWgXVsY4iE3pLbK4mJ9M5+pNELCdynVY6Q3/zjO0+8JN+Pca+Tf499t/gARM3bcJ0h3Kmbu31BlAlBSsVc1+GWWtnLKnFAC+irnKW5JQcdOUvrGiGG99XA3Gesm4IxgZjbeYw+iaa1njsZkti2fJIckJEEMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cigxl8UA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cigxl8UA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0F0C2BCB0;
	Mon, 20 Apr 2026 22:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776722548;
	bh=b/0ABm3fRJfcA0PmJ4fkRGtiHoTpoZM/NNnUWXYxqVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cigxl8UAr5Jmgk5WbQO5avFYEP5p8LVyQnTqp6KpICkVcZDfGhIlIu2jl2PbWTkQi
	 vvjHRYU1J6wWKwWs6y83sBXnufnzX/+u/hKgf+smiNajkMIhYc2gbn6vkfyEjM8r6v
	 WfDcZBnA0VcI/jXlS9Tl7YGEriF0e6ev6oSbp+2M7sKmvAFsQPc7CK4Wyr2nD4ciLg
	 w3WGIBFokH9mXi4yMxXoNJCODRIjLrEnNLgcT1LVDdnPajhgsYypPbKX05QptFhjd3
	 HkkpN3rWrz2GBKXTXdAo+leAP/bzyUwVuo4Ds68gTYBjzV/NxoQAHkx7WfrLoePKQM
	 IyTcImfqt5tnA==
Date: Mon, 20 Apr 2026 15:02:28 -0700
From: Kees Cook <kees@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>, Sun Jian <sun.jian.kdev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: harness: Restore order of test functions
Message-ID: <202604201502.AA9836C@keescook>
References: <20260420-kselftests-harness-order-v1-1-b3c603782ce8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420-kselftests-harness-order-v1-1-b3c603782ce8@linutronix.de>

On Mon, Apr 20, 2026 at 10:44:04AM +0200, Thomas Weiﬂschuh (Schneider Electric) wrote:
> The recent addition of explicit constructor orders for fixture tests
> broke the ordering of those relative to non-fixture tests and the
> reverse-constructor-order detection.
> 
> Restore the ordering of the test functions relative to each other by
> using the same explicit test order for all test registrations and
> __constructor_order_first().
> 
> Rename the constant, as it is not specific to TEST_F() anymore.
> 
> Fixes: 6be268151426 ("selftests/harness: order TEST_F and XFAIL_ADD constructors")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Ah, good catch!

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook
