From: jarkko.sakkinen@linux.intel.com (Jarkko Sakkinen)
Date: Fri, 16 Nov 2018 13:44:12 +0200
Subject: TPM2 smoke tests
Message-ID: <20181116114412.GA7316@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181116114412.aSmdAJsLkljCoKcJ-PA4plIJL6SU1TYPCxfSrqqJHRw@z>

Hi

Now that I got into adding selftests [1] I started to think if I should
also move my TPM2 smoke tests as part of them.

The project resides here:

https://github.com/jsakkine-intel/tpm2-scripts

I wonder if selftests can be done with Python in the first place or do
they have to be implemented in C?

[1] https://lkml.org/lkml/2018/11/16/274

/Jarkko
