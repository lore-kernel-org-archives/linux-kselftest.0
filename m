Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21C1957E8;
	Thu, 12 Feb 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770901151; cv=none; b=JVyo7LkjDzT0elOf3XrlGagKKW+0/5vp/x4hywDJAK9+a3MYRhwuilaIGPIPz5ujzRH5yFwHNYepLGDiJd3cZE12XTTKvtzJgo1qh9PkJwnmYKYUZCfbn1EaFuEkn1I3nSlid/EYNsWl9yQoRWeksx3tO+8z66J+7uK0v0iLRek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770901151; c=relaxed/simple;
	bh=NpzLkdW8jXvjXyCAdGJ2aaYK5afE0bKYG7engXl5Z7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbjhYcRAeBwBjzuLc7wOS5taSomqnXZDGPvUhsLgJ0HjyHpgyOX9587IwyCo/f/cge9+oM7lAEDi+NasIOfvvflZlEIhkh5TgqKhG43oQZ6WYy8ii3WnnLRRnBu2y4QGwHycpBqgkKIeHFjZsPKfecbJxRGZexiXLcxE+GO4uAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FILRQXDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FILRQXDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93959C16AAE;
	Thu, 12 Feb 2026 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770901151;
	bh=NpzLkdW8jXvjXyCAdGJ2aaYK5afE0bKYG7engXl5Z7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FILRQXDzGZKfXmuKAK5ZrnbeyItSpJgxWSqHXBdroPiHoCIqjbba730FzEi+WFI4W
	 k+Fl4YWxJlJiZBcU9xiniAR8O6RhDjaRFAy/1FUP3U+k/IW7Tr115GvL+dz8ftH240
	 bwu3kNGquh9vMZdHyJKw94B4PbK7jX9Q5h8vnyWA=
Date: Thu, 12 Feb 2026 13:59:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
	brendan.higgins@linux.dev, raemoar63@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	acarminati@nvidia.com, linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech, kstewart@linuxfoundation.org,
	chuckwolber@gmail.com
Subject: Re: [RFC PATCH v3 1/6] Documentation: extend the 'Function
 documentation' with expected behavior and constraints of use
Message-ID: <2026021221-grading-clatter-b7bf@gregkh>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
 <20260212124923.222484-2-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212124923.222484-2-gpaoloni@redhat.com>

On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> Extend the longer description section of a function kernel-doc
> header with an itemised list of function's behaviors and
> constraints of use.
> These are useful to link and trace test cases (e.g. KUnit) to
> the different behavior IDs and define the constraints to be
> met by the function's caller.
> 
> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> ---
>  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> index 8d2c09fb36e4..23e6c4b45b14 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -83,6 +83,25 @@ The general format of a function and function-like macro kernel-doc comment is::
>     *
>     * The longer description may have multiple paragraphs.
>     *
> +   * When specifying testable code behaviour the longer description must contain
> +   * a paragraph formatted as follows:
> +   *
> +   * function_name behavior:
> +   * [ID1] - [expected behavior]
> +   *
> +   * [ID2] - [expected behavior]
> +   *
> +   * [...]
> +   *
> +   * [IDn] - [expected behavior]
> +   *
> +   * function_name constraints of use:
> +   * [ID1] - [constraint to be met by the caller]
> +   *
> +   * [ID2] - [constraint to be met by the caller]
> +   *
> +   * [IDn] - [constraint to be met by the caller]

So the same "id" is used for a behavior, AND a constraint?

And what defines an "id"?  I see in your example you use number.number,
but is that specified?

And how is a id going to stay in sync across different files?  That
feels impossible to maintain for any length of time, and puts a burden
on the developer who wishes to add/remove a test or "id", AND a
maintainer who has to remember to go and look in multiple places for
such an id sync up.

That's just not going to work, sorry.

greg k-h
