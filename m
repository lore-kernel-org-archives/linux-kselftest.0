Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599101;
	b=Yfeu795SX9uQ6cuSFAZFzdB53Nnx9Zp7VLKJq/hMMwPZlfxfHvtoVkleKq75onmHTgQr
	 fDWYjs3BcTNCX5ZuYKATzO6hyFsu9+c73HgfTqVk92ooo0a493PhxPpvxg0ZLebNdDvhc
	 ZTmgMnlx+9GBp2UECmeNbkrhHfGnfJ8wYmojCIL6DQMsuc1j6o+pSRmrFy1X2JKSraOjk
	 RmxolGFwMadGsD5+7XJ5kWigTZrFGLmp6//TsL6dujvJQUPL5PBEnTyt+QlpzPPQF+aHF
	 O1jGp/hv1gTbjUl4Pz5JqTJG8inBgAkkUsp+OxvWcHhW11Ivk+QnNiw5EETAtGdExAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
	b=OYQr9I8rxOTogNMQ56Ylfkmvi+S9/l/mEy325VhJWUhq9cgryRpvqQUKLcA5YE0neBLd
	 STyhYoE9W8Im8IZo1UaASrrmnqP4fqTDDY1e9Q3I7tjCUjRLOZMqeJQN5KrGOstmIDZUW
	 q7sRpndU9KETOk4ksAgbRu+WTo0r/EjHA6FUj1Jah4wrHeVi1SnfB5zQNil4C/n77yObL
	 leUFEiDNH5pM77rUZe+2HxkHPISdY2o3NSOf9wTjGX2J9MbkJEJoJ6wYwiTnmDuKDBubn
	 v03lw9F0enev3C7Cg1edz3DzWkmsOKjqU5lCQHqZdAoWpSwWrNBXF6iEn0HECFjUjeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F30Xv+mS;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B8C606A334
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 19:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B8C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F30Xv+mS
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4922523d1afso674426f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 11:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599099; x=1795203899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
        b=F30Xv+mS4lS0O8CpXMoXKeLA6GLKhjJmrWtumTTHsFSFRx5uuE3LGWPibDRVHegjho
         YtR5Pwn95fi02QbWg7Q3lDLTOQ9yO348o4sBjZOu1RdJRS645jcczHhDF4Ob9P7ptWli
         AoOOCoB5EI+pMpioc7P8RDlf7FyuvWnrsNn7uWId+7Wl+8F0mV1S0w+p/qT/DjXeaAjv
         aO+lQ+rtwcWYTv31g6g8qLUdFXBIZB3kYyN4tkm5NOJjnM3KSTF3lLfxEMO/zSB4PbYB
         v8k8eIwbdGAw2nXgM7Zy9nfrKPZCdsJWydnZf3KgSlo0ySEIDDXJzp6bWbgmDL7Ixqfx
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599099; x=1795203899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
        b=Q1dgWDcODK/TQ7DiaUR1AeB36d4jNwCbWudGyWxQt7DShNxQPhjKhTLGj+hN7gmkg5
         WIbK/s5wsOoDQD2B+zlfEPGjfNNL2DcaBC15XLTGCOxilOLHn9DklBaNHynDYrlQqd8B
         N7wrS1ee67/dKAkQ0GFQZvzSxIeJ5z/CBj1qES4B7A2A2TNYeCbeLsw19tvGpnVyw+dR
         pPCqvCkpR6fW8linjb/DbdX079rAfqKVkHPQQDAVI5F9HA14aYEMyYfAXXuwYzTZtfVK
         SglpKnKvsvZT5HUydWyar3PapD+US8ZxGW2xyy54SzqHAGXgT7/GaXmF81gJfyQBCfPw
         dPZQ==
X-Forwarded-Encrypted: i=1; AL+hErHLiLiqv2f6isLLdlaLvmvk3JNSFYV3MokuA0vcGgCH6QF1//gQ5unJXE5TG/cTPOYC8fiPLNo3dbJDATcV3rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jTEAGaElo4WJkdhRVl2Zp0PNoE/VJRS4cSoyJiV/D68SkAl04
	8LWTIF6PPymV/9m4SLV6H1GRzQq3XqoYgxFNXVRHdeQGX600xcfO7y8d
X-Gm-Gg: AYBFou2un6xQ2KLaHiYemmKsPEXYAD//yf0BXS6AgJUyJxkV/LzDbu9W2YGbLaw1vwf
	ijAuRezuO21O5xbuAT5lZdKbodK/quC5wFNRhuBaySgh1bh3shiXt96JrSVM56S2KdKD5NVJ2ie
	PWIq4XVpBiC6RT8Cuk4sEJN/vtsQaxgg2fv8R2DxNv2hjQ4Ojsfn5agEQ74Zf6AviTajW/zI+qP
	XxwKhADeZk1glxndL4icYxDMNSKeE83qoBjKc7QNMiGrI2iifC8tL4Z87awmmShFjbO0EDDm/Mj
	iBaw8G83HFJGl6WnOA0cwHeyXHU9+xuaNvgXsTPeTkhlVIJFFjLAbTW0JEOMzUmfVXapgneDsxq
	UKs/tUU8j+YMeJJV02CW3f6fUEp3dkcUtbQbPzatc1iPDUs/CU96rXPlOB2F6cz6AmLTs1YTj48
	gWV7CeFEcpa8QPU/4eRY66K0oqTbPsaK9ISO15I2Ot1W92y5MaI2LNDxsIE410gBH5kK87NGVjc
	CsYcy03raNYWluTVrvy9lWPZ0iwfSPT/g/vZK2Ju01dJ4zcPa3qNS874zXV4LJwHzE/g+676m9k
	pJGfBI7SvIBi+MnJtBePhImRTMzImoh6nNTBvjKwlyywgcv1FvHz8Q==
X-Received: by 2002:a5d:5c03:0:b0:492:9630:6a71 with SMTP id ffacd0b85a97d-49c6fc9dbe9mr8723383f8f.1.1794599098394;
        Fri, 13 Nov 2026 11:44:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6647059f8f.12.2026.11.13.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:44:57 -0800 (PST)
Date: Fri, 13 Nov 2026 20:44:44 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] landlock: Simplify landlock_get_fs_access_mask()
Message-ID: <20261113.a18c311fd502@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-3-2b405fc1b3aa@gmail.com>
 <20261113.ojir0eich9Ja@digikod.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.ojir0eich9Ja@digikod.net>

On Fri, Nov 13, 2026 at 12:25:36AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:50PM +0100, Günther Noack wrote:
> > Return the handled FS access mask as it is, instead of artificially
> > adding LANDLOCK_ACCESS_FS_REFER to it.
> > 
> > Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
> > rights"), the merge operation already bakes the initially denied
> > access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
> > access rights. -- They don't need to be added explicitly any more.
> > 
> > No functional change.
> > 
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> >  security/landlock/domain.h | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> > index d9ebf4857fce..812c324cb6ef 100644
> > --- a/security/landlock/domain.h
> > +++ b/security/landlock/domain.h
> > @@ -262,16 +262,12 @@ static inline access_mask_t
> >  landlock_get_fs_access_mask(const struct landlock_domain *const domain,
> >  			    const u16 layer_level)
> >  {
> > -	access_mask_t handled = domain->layers[layer_level].handled.fs;
> > -
> >  	/*
> > -	 * Handles all initially denied by default access rights, but only for
> > -	 * layers handling filesystem accesses.
> > +	 * Initially denied by default access rights are already included for
> > +	 * layers handling filesystem accesses, see
> > +	 * landlock_upgrade_handled_layer_config().
> >  	 */
> > -	if (handled)
> > -		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
> > -
> > -	return handled;
> > +	return domain->layers[layer_level].handled.fs;
> 
> Could we add a small companion KUnit test to make sure the semantic
> doesn't change?

Sounds good, I'll add one.

I'm running under the assumption that what you mean here is a test
that covers both the upgrade function and
landlock_get_fs_access_mask(), so that that KUnit test keeps working
in both versions of the change.  I'll stack it as a separate commit
after the first of the two changes to landlock_get_fs_access_mask().

–Günther
