Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAA19ABD8;
	Mon,  2 Mar 2026 02:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417149; cv=none; b=XHROSNFX0jYctgiVPY4kyLllOe5TZ4umCd6LdY7HH0bI4HmYIB0+fxDqfOmQNNZoD8UnDcLhbmywGgEcVYbGfMoYOgbvBlpuY0lkkI1gwtd9xA/xiwYAAKdcv5l9wBOhReEvEPptHrR4RSnYkQaKMHnTIrfS0YVSBivuVJD1dwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417149; c=relaxed/simple;
	bh=CAUhFJJzjhRw/V69tMHRAVrKgwSIH5+1I6RWa8fSKj0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfe0FqoGPn+OdsaiW/iHKXUdd6dECLtysqOdI0zSnsLvQtacwa04KGOPFBEplBEWXzCnAD69jRaHuKd1pQugE6PqSB4L6rpadcihuvFbj/f9S6cZpXqUQEwR8Ndf/7H9Y9zRhYNxkEVhoO2kZE2SzHBPwsqTWuSe9JNJCZRL8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 3824513BCBE;
	Mon,  2 Mar 2026 02:05:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id F03A92F;
	Mon,  2 Mar 2026 02:05:38 +0000 (UTC)
Message-ID: <e8dee2d6856b6ab4752c93f571a9ba582da070ac.camel@perches.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test
 files
From: Joe Perches <joe@perches.com>
To: Matteo Croce <technoboy85@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, 	linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 01 Mar 2026 18:05:38 -0800
In-Reply-To: <CAFnufp3ufMfv8BYLNSqJWoybRMcw5FeuFThp-mRBTU9sYUb=WQ@mail.gmail.com>
References: <20260301011131.4057-1-teknoraver@meta.com>
	 <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
	 <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
	 <b7d028a084ddda66058504aab72032cb9beaf771.camel@perches.com>
	 <CAFnufp3ufMfv8BYLNSqJWoybRMcw5FeuFThp-mRBTU9sYUb=WQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: F03A92F
X-Stat-Signature: ze4tug4gcrygsigoq7fbnxhjcyqcd1wf
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/jZA+kqXQ+eZCI/IHMc0PE4enXDcP1ogg=
X-HE-Tag: 1772417138-688561
X-HE-Meta: U2FsdGVkX18Nlh4zBag5pqZKnNPGpiOjTjfAncCU+7i2KQsnguL/LuAHbnoMyZ0UQpbLR42QUahFkMEsa6Qy0UwXMgegX2nA5B04LN51jUWshPi36ph5vTyrBh2eoKhafZzmUtCUjspMOikH+6ytDUUEo+jEQLFe/S5zMpqBCfA+5HlJPwizdZCPQROA+3SVzEJ2JeKBRhVTHWGmdaGGI+SHM85U9o6QsYIJX7MHFT85LZ1AJHTq+MAjmMeRrbYNqG7cFF1S6FB2WjSQcAeUEbr8bZZtqOUCf8xzwEllqSy4lGXkmF5RggFOaHbIOGLnWKGR8ElSv+zVQzHhNn1UJcQpMvBVKkEs4Erc4L0Qst5NcplRdJv72nTvAwBtcE3gwFakYnRg8eqV8XkMSbSCkUxKgYx3Nepw

On Mon, 2026-03-02 at 01:50 +0100, Matteo Croce wrote:
> ```
> Il giorno dom 1 mar 2026 alle ore 17:42 Joe Perches <[joe@perches.com](ma=
ilto:joe@perches.com)>
> ha scritto:
>=20
> > On Sun, 2026-03-01 at 12:17 +0100, Matteo Croce wrote:
> BTW at this point it would be useful to implement the ** glob operator,
> > > but maybe it's not worth it.
>=20
> >=20
> > Hi Matteo.
> >=20
> > Given you've now touched get_maintainer, you are welcome to do it.
> > Maybe change "sub file_match_pattern {".
> > But I believe this is the first actual use case so I will not.
>=20
>=20
> Mmm not really the first usage, I see this pattern being already used:
>=20
> $ grep -F '/*/*/' MAINTAINERS
> F: Documentation/devicetree/bindings/*/*/*ma35*
> F: drivers/*/*/*ma35*
> F: Documentation/devicetree/bindings/*/*/*npcm*
> F: drivers/*/*/*npcm*
> F: arch/*/*/*/*ftrace*
> F: arch/*/*/*ftrace*
> F: drivers/net/ethernet/*/*/*/*/*xdp*
> F: drivers/net/ethernet/*/*/*xdp*

Nope.

Those are specific directory depth matches.
Your use case is _all_ directory depth matches.

> I tried to implement it and seems easier than expected, the chunk below d=
oes it
> (validated with: scripts/get_maintainer.pl --self-test=3Dpatterns)
>=20
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl

This doesn't apply as there are tab/space problems.

> @@ -375,7 +375,9 @@ sub read_maintainer_file {
[]
> @@ -1045,12 +1050,8 @@ sub file_match_pattern {
>       return 1;
>   }
>      } else {
> - if ($file =3D~ m@^$pattern@) {
> -     my $s1 =3D ($file =3D~ tr@/@@);
> -     my $s2 =3D ($pattern =3D~ tr@/@@);
> -     if ($s1 =3D=3D $s2) {
> - return 1;
> -     }
> + if ($file =3D~ m@^$pattern$@) {
> +     return 1;

and I think the count of / characters matters
but if you send a patch that applies, I'll verify.

cheers,=20
>   }
>      }
>      return 0;
>=20
> Regards,
>=20
> ```
