From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 07:57:11 -0700
Subject: [PATCH v13 14/24] selftests/vm: generic cleanup
In-Reply-To: <1528937115-10132-15-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-15-git-send-email-linuxram@us.ibm.com>
Message-ID: <e50fa00b-724e-ebcb-38b4-22cad9bee1c5@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180620145711.rVP6Oaz6XdtwyqophwjpYAP7E6tBojBP1wNxOT3lPZ0@z>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> cleanup the code to satisfy coding styles.

A lot of this makes the code look worse and more unreadable than before.
 I think someone just ran it through lindent or something.

I also took a few CodingStyle liberties in here because it's _not_ main
kernel code.  I think the occasional 85-column line is probably OK in here.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
