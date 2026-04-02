Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40235F8B7;
	Thu,  2 Apr 2026 04:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775103194; cv=none; b=DF0PMLeUk0weinuBce+3OqeEx10Rqq1/vlEoffJDsArBlvs32S0OW+Q3+2yEF8phHeg/Qlb0v/n0kMJH1oIwYAaQDGSZFF97VVUgH8wNUFuD9DdqTmEl08utqsCIzaxStsVmeMttfM4ahgQx5/jUufil89S5AUjRG7Bb9PnCHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775103194; c=relaxed/simple;
	bh=OvdET8Mrh+XZccL8SL1bj+zx/euoxwKJ3Po3p93KsM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCZ325SZbynlrAeiqW8WMPMFf/a6RBoFACmGvocATGSY+b5B9sQvTPGtBwFTqp8X28hnuQEEIAFjM9BJ0jXAzqC4Zudqw3U7wyYwJUtdaFOYyf6ZvbLH5xYud6DVzvMCv4j70OIdkb0GhfdnAfpr0Jlz4KtemR6A85kkBbHM8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iVVgtmCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iVVgtmCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F727C19423;
	Thu,  2 Apr 2026 04:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775103194;
	bh=OvdET8Mrh+XZccL8SL1bj+zx/euoxwKJ3Po3p93KsM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVVgtmCWgwSjMeJyxdujumkIbgVQC6MY2vW096LQjSWUjCZFQn7E4qaNbNDdbpT/5
	 jMxxTjXQEankdJsnuYHTYuJ+GSjOOKPadTVwBI+BfcjwF6aHgH8DsTN/BDQmHmQLmm
	 JYMCJoxz/4b/o79KuEXsFadTMJ/Fy6Xxpce3eZ0M=
Date: Thu, 2 Apr 2026 06:13:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Michal Grzedzicki <mge@meta.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 0/2] firmware_loader: allow firmware_class.path to
 take multiple paths
Message-ID: <2026040212-passivism-stimuli-2670@gregkh>
References: <20260401-fw-path-v6-0-4ebe70441839@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-fw-path-v6-0-4ebe70441839@kernel.org>

On Wed, Apr 01, 2026 at 09:43:26AM -0400, Jeff Layton wrote:
> This is something Michal had asked for last year, and I just got around
> to implementing. This version is just a minor cleanup for
> reviewability's sake. I also renamed the search= option to search_path=.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---

While it is still experimental, and might not be fully correct, you
might want to look here:
	https://sashiko.dev/#/patchset/20260401-fw-path-v6-0-4ebe70441839%40kernel.org
to see a few potential issues for this patchset (notibly at least the
bash stuff)

thanks,

greg k-h
