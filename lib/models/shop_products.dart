import 'product.dart';

Product photoshop = Product(
  id: 1,
  name: 'Adobe Photoshop',
  catagory: 'Image Editing Software',
  image: 'images/photoshop.jpg',
  description:
      'Adobe Photoshop is the industry-standard software for image editing and graphic design. It offers a comprehensive suite of tools for photo manipulation, digital painting, UI design, and compositing. Ideal for photographers, artists, and designers who need precision and creative flexibility.',
  price: 239.88, // Annual subscription price ($19.99/month)
  quantity: 1,
  specs: [
    '2.0 GHz processor',
    '8 GB RAM',
    '1 TB HDD or SSD',
    'Windows 10 or macOS 11+',
    'GPU with DirectX 12 support',
  ],
);

Product illustrator = Product(
  id: 2,
  name: 'Adobe Illustrator',
  catagory: 'Vector Graphics Software',
  image: 'images/illustrator.jpg',
  description:
      'Adobe Illustrator is a professional vector graphics application used to create logos, icons, illustrations, and typography. It provides powerful tools for precision drawing and scalable designs, making it a favorite among branding and UI designers.',
  price: 239.88, // $19.99/month annual plan
  quantity: 1,
  specs: [
    '2.0 GHz processor',
    '8 GB RAM',
    '1 TB HDD or SSD',
    'Windows 10 or macOS 11+',
    'GPU recommended',
  ],
);

Product premiere = Product(
  id: 3,
  name: 'Adobe Premiere Pro',
  catagory: 'Video Editing Software',
  image: 'images/premiere.jpg',
  description:
      'Adobe Premiere Pro is a professional video editing software used in film, television, and web content production. It supports high-resolution formats, multi-cam editing, color grading, and seamless integration with After Effects and Adobe Media Encoder.',
  price: 275.88, // $22.99/month annual plan
  quantity: 1,
  specs: [
    '3.0 GHz quad-core processor',
    '16 GB RAM',
    '1 TB SSD',
    'Windows 10 64-bit or macOS 11+',
    'GPU with 4GB VRAM',
  ],
);

Product word = Product(
  id: 1,
  name: 'Microsoft Word',
  catagory: 'Office',
  image: 'images/word.png',
  price: 159.99,
  description:
      'Microsoft Word is a leading word processor used worldwide for creating and editing professional documents. It offers real-time collaboration, grammar suggestions, templates, and seamless integration with OneDrive and Microsoft 365, making it a must-have for business and academic work.',
  quantity: 1,
  specs: [
    '1.6 GHz CPU',
    '4 GB RAM',
    '4 GB disk space',
    'Windows 10+',
    'Internet for activation',
  ],
);

Product excel = Product(
  id: 2,
  name: 'Microsoft Excel',
  catagory: 'Office',
  image: 'images/excel.png',
  price: 159.99,
  description:
      'Microsoft Excel is a powerful spreadsheet software that provides tools for data analysis, visualization, and automation. It supports advanced formulas, pivot tables, charts, and integration with Power BI, making it ideal for professionals in finance, data, and operations.',
  quantity: 1,
  specs: [
    '1.6 GHz CPU',
    '4 GB RAM',
    '4 GB disk space',
    'Windows 10+',
    'Office 365 account recommended',
  ],
);

Product powerpoint = Product(
  id: 3,
  name: 'Microsoft PowerPoint',
  catagory: 'Office',
  image: 'images/powerpoint.png',
  price: 159.99,
  description:
      'Microsoft PowerPoint is a presentation tool that enables users to build dynamic slide decks with animations, media, and professional templates. It\'s widely used for business meetings, classroom instruction, and webinars due to its user-friendly interface and collaboration features.',
  quantity: 1,
  specs: [
    '1.6 GHz CPU',
    '4 GB RAM',
    '4 GB disk space',
    'Windows 10+',
    'Microsoft account required',
  ],
);

Product msProject = Product(
  id: 4,
  name: 'Microsoft Project',
  catagory: 'Office',
  image: 'images/project.png',
  price: 579.99,
  description:
      'Microsoft Project is a project management software designed to help teams plan, execute, and monitor projects. With Gantt charts, timelines, resource management, and task tracking, it supports professional-grade scheduling and project delivery.',
  quantity: 1,
  specs: [
    '2.0 GHz dual-core CPU',
    '4 GB RAM',
    '4 GB disk space',
    'Windows 10/11 Pro',
    'Office LTSC or 365 account',
  ],
);

class ShopProduct {
  static List<Product> alProducts = [
    photoshop,
    illustrator,
    premiere,
    word,
    excel,
    powerpoint,
    msProject,
  ];
  static List<Product> adobe = [photoshop, illustrator, premiere];
  static List<Product> office = [word, excel, powerpoint, msProject];
}
