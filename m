Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC13D8914;
	Mon, 28 Sep 2026 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593349; cv=none; b=jI98tX0nHNiWsIDgUOPVjhmMKWvyEUi+ZrsiYrH1rDdDAUxP1vUxp0OzLwhOUbX2NJloE87JI2mv/7mYlLxUiEXR3mecoUZ3nEli5YZgEyqxtjbXGkECxfjN+kBbzbdxWEqkXqW/1jRzJTRj/k9cXSF7bSksIPKjlBoH0HW0QTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593349; c=relaxed/simple;
	bh=5R6UO3TqFeIxjkIC/SlXaui9exI2X0GLFxuuUBDIKVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLAHpv6aIafbYveHCXfVlGW4slAAT912clC4Vv1x9nZ37VGfMcW2MjJ975Pw+Czc6cR69iRpvofPTAYyjZ32DOlIjqlNsROsydPI3HxfOfNbXN0aeb9E3W3TcfBfDGFWcFB+mlZ/AiJqoDSGYk+ekU/xAWeKEO84X6kyJcRyyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5xX1lSh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5xX1lSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFDF1F000FF;
	Mon, 28 Sep 2026 11:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593348;
	bh=1W7l83jUfjOncW8PpsfsUeV8UefI+hmLcibr0Kwb2lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5xX1lShmpX9gshtl6gLw77w8dT+LjbmwtZFY8t5Dl/buHBhU/6Ohi9vnSWJUOUPd
	 rCqX9TY3Zmx1/wY2RCywDM0Pjei19fgcvxg34JLGGf4OoRIlLYf1hT73Kc9CYEijJK
	 Wedf80nHwYuvXCL/VQzZYhsTXtN/OMeqGSTMdKVFh4W6l7HhcNBXSatsIUky8RloVn
	 lPFmOTL5wdGQFLdnStZ3WYujaZ5UVqzPH/dTMPSLP1R2G9bNW3wJ3KwpbVkQoFHTn4
	 LKGsMN2V/v8UOC+lI0aouU6ethezKEqKSOEkwQkmxJx05H/r7S9WnAoQ+0LS/lZUYc
	 8VxYaWsBFWDQQ==
Date: Mon, 28 Sep 2026 12:02:19 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, david@kernel.org, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v3 1/3] selftests: kselftest: avoid cd - in runner
Message-ID: <arpJBaUzzsLEZgDy@gremlin>
References: <20260926010819.604346-1-thehajime@gmail.com>
 <20260926010819.604346-2-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926010819.604346-2-thehajime@gmail.com>

On Sat, Sep 26, 2026 at 10:08:17AM +0900, Hajime Tazaki wrote:
> The kselftest runner currently uses `cd -` to restore its working
> directory after running a test.
>
> This is not supported by the minimal BusyBox hush shell used by some
> NOMMU targets. Store the original directory explicitly and restore it
> with a quoted path instead.
>
> This also avoids printing the directory change performed by `cd -` and
> handles paths containing whitespace correctly.
>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Brendan Jackman <brendan.jackman@linux.dev>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: "Ricardo B. Marliere" <rbm@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

Looks fine to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kselftest/runner.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 311811dc55a0..8fc1018d6fec 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -130,6 +130,7 @@ run_one()
>  				return $KSFT_FAIL
>  			fi
>  		fi
> +		OLDDIR=$(pwd)
>  		cd `dirname $TEST` > /dev/null
>  		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
>  			tap_prefix >&4) 3>&1) |
> @@ -147,7 +148,7 @@ run_one()
>  		*)
>  			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
>  		esac
> -		cd - >/dev/null
> +		cd "$OLDDIR" >/dev/null
>  	fi
>
>  	return $rc
> --
> 2.43.0
>

--
Cheers, Lorenzo
