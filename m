Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFE4AD7F6;
	Wed, 30 Sep 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766806; cv=none; b=cAGZY5n5S1zgAtpDY6hfm1mC9WtvrE7wwupyixh4VJCsFujfCdjImlgpTRf/X6hWK+O7INfmSughD4tuh9nC3P90bqTvgs4tVTpp3Il/iAjbe7ClbiasN4xmTJ61zvawqg4EDKgsHb5CQdbjoa7vWhfR57KCe6gr126beRMxAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766806; c=relaxed/simple;
	bh=HmpspcC+RhhDytTUP59qV6yEFCKfcwLZxjPXlU1pqi0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=caNbvtJerisDb6BSVtBocWXjReqpUlPbYZWNjnGjp6UWGb1+fxCio6cwT7+AKAur7Ti6cO5WNMRUrhSykuOVl7412pM3k7/d4ylbBTPGJlQZkPlUqJoIDKNCVf6QZQC1+ZUy7RQeNKWcMar2QOG9V6Fcok+oDYKe5RYRquTy4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=iR6ERfhJ; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="iR6ERfhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790766792; x=1791025992;
	bh=HmpspcC+RhhDytTUP59qV6yEFCKfcwLZxjPXlU1pqi0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iR6ERfhJz9sxAcYjiBPQY2JenKeeLyvVEyMebcS0AOfw/oMOBFSgIPOIP10uhS8uj
	 He48mCLnYDs9DYoyIqRDEMQphr0WETdDnNp3G+WeU8uCedxdav5sF12ZlfGpWeJJi+
	 gPbaasCrtYlN322MEbt0UIYqRPRRMW2yM6Yhkc0o7UaiIU1043RmYHk8UyBMwVi6f8
	 DCZCrllkLq8rUQdLfCw5m2Won4JF6+m+lJG9USiGc/elSBPiz6JFPwzS+UHPVAeHmq
	 yqK3yht3eQyD0EYo8UtEWaRVSU7jTDXqH5+n1cHPj1PqPp1OhkA0QLMVQkymHwxU67
	 3f8M1v0u4R2bQ==
Date: Wed, 30 Sep 2026 11:13:07 +0000
To: "Eric W. Biederman" <ebiederm@xmission.com>
From: Natalie Klaus <natalie.klaus@runtimeverification.com>
Cc: Christian Brauner <brauner@kernel.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] userns: reject out-of-range uid_map/gid_map values
Message-ID: <WXf-G6SORqmuzItmtxszS_3my7DUHx4xJPg1zt19dY9NemD-lMeZtpLe7R2O1Q29HRwYJyJHA9lKMKhQ5zh1EuyiBYIgl4WveBBjv4DeK3s=@runtimeverification.com>
In-Reply-To: <87tsn932ax.fsf@email.froward.int.ebiederm.org>
References: <20260928072537.115668-1-natalie.klaus@runtimeverification.com> <87tsn932ax.fsf@email.froward.int.ebiederm.org>
Feedback-ID: 202241500:user:proton
X-Pm-Message-ID: 3941f5e2367560ef297a0694df1746517fd579f0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------ec4685ee43f69ec5fccad79f2764e2f116fab202a8bab58b65195e5b8011b88b"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------ec4685ee43f69ec5fccad79f2764e2f116fab202a8bab58b65195e5b8011b88b
Content-Type: multipart/mixed;boundary=---------------------6c7566460754075792ebdbbaf5ab9b50

-----------------------6c7566460754075792ebdbbaf5ab9b50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Mon, 28 Sep 2026, Eric W. Biederman wrote:
> Storing an unsigned long into an unsigned long long instead of an
> unsigned is a mistake in the opposite direction and is more costly.
>
> A more targeted fix would be to replace simple_strtoul with
> kstrtou32.

Agreed. I went with ull to keep the end-pointer parsing, but the buffer
is our own copy, so terminating each field and calling kstrtou32() on
it is simpler and cheaper. Will do that in v2.

> As for tests you probably also want to test some negative values as
> well, and probably a few good values.

Will add both.

Thanks for the review,
Natasha
-----------------------6c7566460754075792ebdbbaf5ab9b50
Content-Type: application/pgp-keys; filename="publickey - natalie.klaus@runtimeverification.com - 0xE0915B3B.asc"; name="publickey - natalie.klaus@runtimeverification.com - 0xE0915B3B.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - natalie.klaus@runtimeverification.com - 0xE0915B3B.asc"; name="publickey - natalie.klaus@runtimeverification.com - 0xE0915B3B.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FYWliamxCWUpLd1lCQkFI
YVJ3OEJBUWRBZ3Z4bXV1L0FnZHNGSi9tc2x1RDY0UStNUjI4c0c2Z0IKeW5ITEc1UFEvcFROVFc1
aGRHRnNhV1V1YTJ4aGRYTkFjblZ1ZEdsdFpYWmxjbWxtYVdOaGRHbHZiaTVqCmIyMGdQRzVoZEdG
c2FXVXVhMnhoZFhOQWNuVnVkR2x0WlhabGNtbG1hV05oZEdsdmJpNWpiMjArd3NBUgpCQk1XQ2dD
REJZSnFKdU9VQXdzSkJ3a1EwOVNqeW5sWVkyWkZGQUFBQUFBQUhBQWdjMkZzZEVCdWIzUmgKZEds
dmJuTXViM0JsYm5CbmNHcHpMbTl5Wjl1TktTVWgra2ZuU01JK1J1eWl1WFRLZDk2bTVGWDJPenZU
CmdOZlZTd2Z0QXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRTRKRmJPMUVESUEwa0lsLzAwOVNq
eW5sWQpZMllBQVBieUFRRFNsK2VjWS96UjI4RGxXNEk4SUNmU2RHWmtqVWFNMFZ5RVpDWkg0Y3JU
WFFFQTNEelkKTUJQMHdtM0lpeW43bUlIODFIWUZsQ09jVmhxUEdpVkJsWDZ1L3dQT09BUnFKdU9V
RWdvckJnRUVBWmRWCkFRVUJBUWRBVER2UmtFK3poTmVkeWFGMks1dUZBRFlzbG9kRVp4c2xhTS9s
Z0dMY3FRNERBUWdId3I0RQpHQllLQUhBRmdtb200NVFKRU5QVW84cDVXR05tUlJRQUFBQUFBQndB
SUhOaGJIUkFibTkwWVhScGIyNXoKTG05d1pXNXdaM0JxY3k1dmNtZGtvdTBDVHZ2R21nN3lkZ0Nu
QzNsa1NpSFdaSG81ZzBQNys5ak1KMEpsCkxnS2JEQlloQk9DUld6dFJBeUFOSkNKZjlOUFVvOHA1
V0dObUFBQ0ZaQUVBczhidWE0bVJYbEdCdHZTMQo5M0VBektIQXU0TkhFdmc2alhuWVgrZGZrSjRC
QUo2TlJ3YitGVkpSdGJ4bk5ud05rV2tPRUZHUVo5TVAKMkw5KzF5N3pWdkVJCj02RytBCi0tLS0t
RU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0K
-----------------------6c7566460754075792ebdbbaf5ab9b50--

--------ec4685ee43f69ec5fccad79f2764e2f116fab202a8bab58b65195e5b8011b88b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0Fgmq87rMJENPUo8p5WGNmRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfN/Xkl52ZSMFP58KtPkSrcCnsW2fh+CyrgeMuq
ZUENXBYhBOCRWztRAyANJCJf9NPUo8p5WGNmAACfiwEAkcLlR/uEuseAbOSs
yKrUWEtEWAXcDRFEB5StZ25ZXEsBAM/5+oRrQuGrZW8nEwFWzgAFa/N3X5PF
HF2dwZywrTQA
=BBTX
-----END PGP SIGNATURE-----


--------ec4685ee43f69ec5fccad79f2764e2f116fab202a8bab58b65195e5b8011b88b--

