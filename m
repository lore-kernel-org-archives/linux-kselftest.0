Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410723FCB05;
	Mon, 27 Jul 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159156; cv=none; b=qMABzBDBHHutZEh+EcYkCHsqUkXwkeVtX5mQj3Zk5/9iEZds2m/j6WRODKNstaTjUe53mIPzBqpeFZZR3pIACR+bKX+xhKcyqWQGBE/PJ23pJOvN6jOLM4sghxcInzkJ/r23+t9jhbjAe2CEfc5VmHIM5uSDz81j84UP1vbosSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159156; c=relaxed/simple;
	bh=7PlcYIsR1Dea1fqCuc3CltfPpXXQj+ZnW/e2ikRSeEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ty31eTFAA/fSp1jTO1pStvumEOLw/3dr+yB9xo18JJYA8mexGSqzDMGmXZSLtkhdlTvxEiIz96XLDEYtCr7tZeivCc5ye/2nOJv64U0zeOSWdgpTILo+L8plyfJxhu2tWagIbaD7qfRHJcgEd8WSKhNjkdO3WyXp5+yN3+SAR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HjUNWgbP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HjUNWgbP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wG0RfBpNUe463/QF31Ka/dPbn+jFOBnSz6yalV6z41E=; b=HjUNWgbPNdY7jGyGxQHmLt3g4S
	Fle6uWXUNpZc2umqjlZwOPSHwsy0ddYfNmKYpTTFfMMOU5xcN4jOhfI9PTdfMzZpp1osMapT7MGyn
	ouxBiNWQLUcCraI+zzw89vtzoc+GXhSYHPQym/TBjYOy8MmmIHcPon0o8HIbkQrdYPJ0GwPrYp+J6
	iP92DTRhD7/wNDhZvTpGr0PX6vTnqKSSwjdCz6zJOcBOPtB5LzdVQMsTJzRmctcHjocMr7t1krX8t
	XEQw1QenX5Bbh/+u4WCnOSYwhdDC/wVS0lPoLDBxJf9zKQ0L3BBKJ/hZwI4HEqSaJxdqKXu+Kq7AP
	eOKswTkA==;
Received: from [2001:8b0:10b:5:45df:678b:e980:5dcd] (helo=u09cd745991455d.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLRQ-0000000Akaj-2bUr;
	Mon, 27 Jul 2026 13:32:24 +0000
Message-ID: <bfa3af6b673f3edbec63d2fa13073eabd86522d1.camel@infradead.org>
Subject: Re: [PATCH v5 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
 <davem@davemloft.net>,  Jakub Kicinski	 <kuba@kernel.org>,
 netdev@vger.kernel.org, Richard Cochran	 <richardcochran@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni	 <pabeni@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Miroslav Lichvar	 <mlichvar@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu	 <guwen@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Yonatan Sarna <ysarna@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Alexander Matushevsky	
 <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson
 <msw@amazon.com>,  Anthony Liguori <aliguori@amazon.com>, Nafea Bshara
 <nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>,  Netanel
 Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin
 Herrenschmidt <benh@amazon.com>,  Noam Dagan <ndagan@amazon.com>, David
 Arinzon <darinzon@amazon.com>, Evgeny Ostrovsky	 <evostrov@amazon.com>,
 Ofir Tabachnik <ofirt@amazon.com>, Amit Bernstein	 <amitbern@amazon.com>,
 linux-kselftest@vger.kernel.org, 	linux-doc@vger.kernel.org,
 shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
	 <bhelgaas@google.com>, vadim.fedorenko@linux.dev
Date: Mon, 27 Jul 2026 14:32:23 +0100
In-Reply-To: <2a042252-3225-4cd6-8301-8865bc07a387@lunn.ch>
References: <20260717065924.2556-2-akiyano@amazon.com>
	 <1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>
	 <2a042252-3225-4cd6-8301-8865bc07a387@lunn.ch>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-yGjzbWbMg5BM2dJpJpd5"
User-Agent: Evolution 3.60.3-0ubuntu1~ppa9~24.04 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-yGjzbWbMg5BM2dJpJpd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-27 at 15:15 +0200, Andrew Lunn wrote:
> =C2=A0
> > I hate all this line wrapping, btw. I'll defer to the net coding style
> > if they insist, but my preference would just be just to have longer
> > lines. Especially when it's a block of assignments like this, the
> > wrapped form is *much* harder to read.
>=20
> This is a long function, probably longer than the coding style
> suggests. So one option is to move the code within the for loop into a
> helper. That might then allow unwrapped lines?
>=20
> That is kind of the point of the line length limit, to make you break
> code up into lots of small functions which do one thing.

Huh? Are we looking at the same function? The version of
ptp_sys_offset_extended_attrs() I'm looking at, having fixed up the
gratuitous line wrapping, is about 60 lines =E2=80=94 none of which are wid=
er
than 100 characters. It's a simple setup and then loop over n_samples
of data captures. A helper function would only serve to obfuscate it.

static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __use=
r *arg)
{
	struct ptp_sys_offset_attrs *data __free(kfree) =3D NULL;
	struct ptp_attrs_request request;
	struct ptp_system_timestamp sts;
	unsigned int n_samples;
	int err;

	if (copy_from_user(&request, arg, sizeof(request)))
		return -EFAULT;

	if (request.valid ||
	    request.num_samples > PTP_MAX_SAMPLES ||
	    request.num_samples =3D=3D 0)
		return -EINVAL;

	err =3D ptp_validate_sys_offset_clockid(request.clock_id);
	if (err)
		return err;

	n_samples =3D request.num_samples;
	sts.clockid =3D request.clock_id;

	data =3D kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
	if (!data)
		return -ENOMEM;

	data->request.num_samples =3D n_samples;

	for (unsigned int i =3D 0; i < n_samples; i++) {
		struct ptp_clock_attrs att =3D {};
		struct timespec64 ts;

		if (ptp->info->gettimexattrs64)
			err =3D ptp->info->gettimexattrs64(ptp->info, &ts,
							 &sts, &att);
		else if (ptp->info->gettimex64)
			err =3D ptp->info->gettimex64(ptp->info, &ts, &sts);
		else
			return -EOPNOTSUPP;

		if (err)
			return err;

		/* Filter out disabled or unavailable clocks */
		if (!sts.pre_sts.valid || !sts.post_sts.valid)
			return -EINVAL;

		data->timestamps[i].pre_systime.sys_time =3D ktime_to_ns(sts.pre_sts.syst=
ime);
		data->timestamps[i].pre_systime.sys_rawtime =3D ktime_to_ns(sts.pre_sts.m=
onoraw);
		data->timestamps[i].pre_systime.sys_counter =3D sts.pre_sts.cycles;
		data->timestamps[i].pre_systime.sys_counter_id =3D sts.pre_sts.cs_id;
		data->timestamps[i].devtime.device_time.sec =3D ts.tv_sec;
		data->timestamps[i].devtime.device_time.nsec =3D ts.tv_nsec;
		data->timestamps[i].devtime.attrs =3D att;
		data->timestamps[i].post_systime.sys_time =3D ktime_to_ns(sts.post_sts.sy=
stime);
		data->timestamps[i].post_systime.sys_rawtime =3D ktime_to_ns(sts.post_sts=
.monoraw);
		data->timestamps[i].post_systime.sys_counter =3D sts.post_sts.cycles;
		data->timestamps[i].post_systime.sys_counter_id =3D sts.post_sts.cs_id;
	}

	return copy_to_user(arg, data,
			    struct_size(data, timestamps, n_samples)) ? -EFAULT : 0;
}

--=-yGjzbWbMg5BM2dJpJpd5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
NDA5NlNIQTM4NDIwMjRDQTEuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQChxpuuHVw93mze9jmueUFV
BJNzvOzZlazrt0AiW1H7TlYQutgKVXPNSEyz8s4k+WsRSjjlQMOiZerfwPEV6lo9336I0uNd+ffc
Rf8gbjiPTiVT+gX9GD1V5AguRgtsJn/H3A6M0dlzhI3J1jsOG9/+xPloHPzy7sPn5rNkntB/VTnv
Bix4IfUy3ScOu2vnLX0gnwP3EknfdEUvq9+kdkEEBDz7dGqQo3EuhXZoW9CHF2GM0sOpO/cuNQh2
JzA+to3smTES7sJXYuRrt5GomCRYvtIrRiYGMalFp+z6Jw/843lEIIpNNvpWVfx5Mbawkl+wWG8k
0IK3rF7FtbNa0it8/s288G/AEHvfsDIQYFmRLlo2LNMxxREkZO/1Qq8GHUsX/602Fi0u88I3uh5w
bOEIeG32NzBKTKBOjdjpiUrdCA676dyaIFt967CUtnUvFti8bqGA2pe/u7pjIANthqMBAlcnY5B6
ff2mbdD8BBLItgb4HyUOCVawzy1hc+UR2tglySwYroWeohfoG6afjesGigsl2JmnhaZ9Z0vanF74
vFEOOmuaq7VamuLEPFQtJM4olmipOW6CzrLcFz6J/6yAecEG3P1ZDoy08eSHvM40MAUgpwGa/w6o
9ALHQXda/c4TJvAylfHQ6wqArzAuV1pfWldwy7IOBMtKqzQBXQ4dSDGCBCAwggQcAgEBMHYwYjEL
MAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTowOAYDVQQDEzFEaWdpQ2VydCBB
c3N1cmVkIEcyIFNNSU1FIFJTQTQwOTYgU0hBMzg0IDIwMjQgQ0ExAhADNSi2uzJskfEdOMo4hV0g
MA0GCWCGSAFlAwQCAQUAoIIBezAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNjA3MjcxMzMyMjNaMC8GCSqGSIb3DQEJBDEiBCAqxCHpZg763GC71lzQXKSzTTmV2Nqd
JRb8GR9vqAMU4jCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGln
aUNlcnQsIEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBT
SEEzODQgMjAyNCBDQTECEAM1KLa7MmyR8R04yjiFXSAwgYcGCyqGSIb3DQEJEAILMXigdjBiMQsw
CQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFz
c3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQgMjAyNCBDQTECEAM1KLa7MmyR8R04yjiFXSAw
DQYJKoZIhvcNAQEBBQAEggIAy+EVQW6NE8YwAVdenpsjQXPjtbpO9QwS7ZuRWeKOYh3zuVMK6zRK
mZOrMRilwsm5eVQNSr9vnngENjV0429c/MlJbVBQ8NievssHJf/rHHuZj0prN7R0WiEmi4QZKdxI
6H2ZSYyJpSe3ZGWN285et7O2FL2CptQ9hovdksR5/iy5T+7CyhiKWjY3QoFWwZHw+P5lgQ+cRTPj
rGdwM4W//5SFd8KOxGNrO24quE4jMws7z4NpaoqZVUmPHYvIaiAP5MQ0Qw7Y89utuHbfsCbQIyD0
jkGEXWHONodntBUj1kWBTakzKJzRzCgO4rS3gkl+fP9h3PnpHpOxHbpVzMT7Q2tKYzXTbzbkO5ou
niqw/h03sOC6U4NcS1KOl1PR4gY7uW0IG0e069GPm+bZdBPA7HogHIitYV1leHgJmTEBcGkG2KeX
HXYO1yn9fmQUJxCFcRyvd44JoGCaQQo8w3f7a16AmyWAFQl/LHyqYcfcKM5UhpiXlbdsrKBHh5hx
pqNqO1FO+F7ZrST7IotlhpTw6uwXF8MlFWTVdtolbtDvVPZc/ejXwDGCl5cm0Xb9a5aQiZv6qG8t
raTlnBFaD2cDAsh1fCw3WXILcYQe0rtiuF4IbXFEjK7lzp9u/GKczTEh+Dc9tQ0pUgJA+bv2kbnH
oMvLikwWj7CDSGCF3wz5ItAAAAAAAAA=


--=-yGjzbWbMg5BM2dJpJpd5--
